#!/usr/bin/env bash
set -euo pipefail
REPO_DIR=$(pwd)
IMAGE_TAG="tcga-loy-demo:$(date +%Y%m%d)"

# 1 Build, if Dockerfile really changed
# docker build --progress=plain -t "$IMAGE_TAG" . |& tee build.log

# 2 Run analysis but DON’T exit on failure
set +e
docker run --rm -v "$REPO_DIR":/workspace "$IMAGE_TAG" \
  Rscript /workspace/run_tcgabio.R |& tee test_log.txt
RV=$?
set -e

# 3 Stage logs no matter what
git add test.sh run_tcgabio.R test_log.txt
git commit -m "Auto build+test $(date -Iseconds)" || true
git push origin HEAD

# 4 Bubble up failures for CI visibility
exit $RV
