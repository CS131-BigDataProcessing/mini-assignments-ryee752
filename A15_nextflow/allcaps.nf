#!/usr/bin/env nextflow

workflow {
    convertToUpperCase()
    params.output.view()
}

process convertToUpperCase {
    input:
    val input from params.input

    output:
    path(params.output)

    script:
    """
    echo "$input" | tr '[:lower:]' '[:upper:]' > ${params.output}
    """
}
