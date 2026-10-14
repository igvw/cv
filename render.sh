#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

usage() {
    cat <<'EOF'
Usage: bash render.sh [en|nb|nn|all]

  en      English
  nb      Bokmål
  nn      Nynorsk
  all     All three languages
  -h, --help  Show this help
EOF
}

if (( $# == 0 )); then
    usage
    exit 0
fi

if (( $# > 1 )); then
    echo "Error: expected a single language or 'all'." >&2
    usage >&2
    exit 2
fi

case "$1" in
    -h|--help) usage; exit 0 ;;
    en|nb|nn) languages=("$1") ;;
    all) languages=(en nb nn) ;;
    *) echo "Error: unknown argument '$1'." >&2; usage >&2; exit 2 ;;
esac

if [[ ! -x venv/bin/rendercv ]]; then
    echo "Run bash setup.sh first." >&2
    exit 1
fi

mkdir -p output/pdf
for language in "${languages[@]}"; do
    case "$language" in
        en) source_file=Ignazio_cv.yaml; pdf_file=Ignazio_CV_EN.pdf ;;
        nb) source_file=Ignazio_cv_nb.yaml; pdf_file=Ignazio_CV_NB.pdf ;;
        nn) source_file=Ignazio_cv_nn.yaml; pdf_file=Ignazio_CV_NN.pdf ;;
    esac
    venv/bin/rendercv render "$source_file" -o "tmp/pdfs/$language" \
        -pdf "output/pdf/$pdf_file" -nomd -nopng
done
