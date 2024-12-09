#!/usr/bin/env nextflow

workflow {
    convertToUpperCase()
}

process convertToUpperCase {
    output:
    path 'output.txt'

    script:
    """
    echo $params.input | tr '[:lower:]' '[:upper:]' > output.txt
    """
}
