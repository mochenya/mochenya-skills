#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
SKILLS_DIR=${SKILLS_DIR:-"$REPO_ROOT/skills"}
OUT_DIR=${OUT_DIR:-"$REPO_ROOT/out"}

if [ ! -d "$SKILLS_DIR" ]; then
  printf 'Error: skills directory not found: %s\n' "$SKILLS_DIR" >&2
  exit 1
fi

ARCHIVER=''
ARCHIVER_KIND=''
if command -v zip >/dev/null 2>&1; then
  ARCHIVER=$(command -v zip)
  ARCHIVER_KIND='zip'
elif command -v 7z >/dev/null 2>&1; then
  ARCHIVER=$(command -v 7z)
  ARCHIVER_KIND='7z'
elif command -v 7z.exe >/dev/null 2>&1; then
  ARCHIVER=$(command -v 7z.exe)
  ARCHIVER_KIND='7z'
else
  printf 'Error: neither zip nor 7z was found in PATH.\n' >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

pack_count=0
for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue

  skill_name=${skill_dir%/}
  skill_name=${skill_name##*/}
  archive_path="$OUT_DIR/$skill_name.zip"

  # Remove an old archive first so deleted source files cannot remain in it.
  rm -f -- "$archive_path"

  (
    cd -- "$skill_dir"
    if [ "$ARCHIVER_KIND" = 'zip' ]; then
      "$ARCHIVER" -rq "$archive_path" .
    else
      "$ARCHIVER" a -tzip -y "$archive_path" . >/dev/null
    fi
  )

  printf 'Packed %s -> %s\n' "$skill_name" "$archive_path"
  pack_count=$((pack_count + 1))
done

if [ "$pack_count" -eq 0 ]; then
  printf 'Error: no skill directories found in %s\n' "$SKILLS_DIR" >&2
  exit 1
fi

printf 'Packed %d skill(s) with %s.\n' "$pack_count" "$ARCHIVER_KIND"
