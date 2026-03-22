#!/bin/bash

git checkout deployment
git rebase master
npm run build
# For deploying under custom domain
find docs/ -name "*.html" -type f -exec sed -i \
  -e 's|href="/profsite/styles/|href="/styles/|g' \
  -e 's|href="/profsite/images/|href="/images/|g' \
  -e 's|src="/profsite/images/|src="/images/|g' \
  -e 's|href="/profsite"|href="/"|g' \
  -e 's|href="/profsite/|href="/|g' \
  -e 's|a="/profsite"|a=""|g' \
  -e 's|${a}/|${a}|g' \
  -e 's|/profsite/|/|g' \
  -e 's|href="/profsite|href="/|g' \
  -e 's|src="/profsite|src="/|g' \
  -e 's|href="/profsite"|href="/"|g' \
  -e 's|action="/profsite|action="/|g' {} \;
  -e 's|a="/profsite"|a=""|g' \
  -e 's|let.*= "/profsite"|let basePath = ""|g' \
  -e 's|const.*= "/profsite"|const basePath = ""|g' \
  -e 's|var.*= "/profsite"|var basePath = ""|g' \
  -e 's|`/profsite|`/|g' \
  -e 's|"/profsite|"/|g' {} \;
git add docs
git commit -m "Generate artifacts"
git push origin deployment --force
git checkout -
