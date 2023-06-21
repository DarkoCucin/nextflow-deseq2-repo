#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { DESEQ2_DIFFERENTIAL } from './main_non_executable.nf'

log.info """

samplesheet      		: ${params.samplesheet}
counts           		: ${params.counts}
contrast_file                   : ${params.contrast_file}
control_genes_file              : ${params.control_genes_file}
outdir              	        : ${params.outdir}

"""

    workflow {
    	if (params.control_genes_file == " ") {
    
	
    		expression_sample_sheet = file(params.samplesheet, checkIfExists: true)
    		expression_matrix_file = file(params.counts, checkIfExists: true)
    		expression_contrasts = file(params.contrast_file, checkIfExists: true)

    	Channel.fromPath(expression_contrasts)
        	.splitCsv ( header:true, sep:',' )
        	.map{
            	tuple(it, it.variable, it.reference, it.target)
       	 }
        	.set{
            	ch_contrasts
       	 }

    	ch_matrix = [[id: 'test'], expression_sample_sheet, expression_matrix_file]
        ch_empty_spikes = [[],[]]

    	DESEQ2_DIFFERENTIAL (
        	ch_contrasts,
        	ch_matrix,
        	ch_empty_spikes
    	)
}
    	else {
    
	
    		expression_sample_sheet = file(params.samplesheet, checkIfExists: true)
    		expression_matrix_file = file(params.counts, checkIfExists: true)
    		expression_contrasts = file(params.contrast_file, checkIfExists: true)
		control_genes_file = file(params.control_genes_file, checkIfExists:true)

    	Channel.fromPath(expression_contrasts)
        	.splitCsv ( header:true, sep:',' )
        	.map{
            	tuple(it, it.variable, it.reference, it.target)
       	 }
        	.set{
            	ch_contrasts
       	 }

    	ch_matrix = [[id: 'test'], expression_sample_sheet, expression_matrix_file]
        
	Channel.fromPath(control_genes_file)
        .map{
            tuple(['id':'control'], it)
        }.set{
            ch_control_genes
        }

    	DESEQ2_DIFFERENTIAL (
        	ch_contrasts,
        	ch_matrix,
        	ch_control_genes
    	)
}
}