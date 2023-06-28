# nextflow-deseq2-repo

This repository was created for the purpose of analysing RNA-Seq data with the Nexttflow Implementation of **Deseq2**. It contains all files necessary to upload and run the Nextflow Implementation of **Deseq2** on **Seven Bridges** platforms (In this case we will focus on **CAVATICA** platform but these files can also be used for uploading **DESeq2** on the other **Seven Bridges** platforms).

### A brief review of files

In this section, we will list files that are part of the repository and give brief information about them:

- *main_non_executable.nf* - This is the main script containing the process definition for the module.
- *main.nf* - This file will define one or more Nextflow workflow definitions that will be used to execute **DESeq2**. Inputs from this script will be streamed to *main_non_executable.nf* script. 
- *nextflow.config* - Some modules require additional parameters added to the test command to successfully run. These can be specified in the *nextflow.config* file that exists alongside the test files themselves (and is automatically loaded when the *main.nf* is executed).
- *meta.yml* - This file will be used to store general information about the module and author details.
- *params.config* - File which also specifies additional parameters as *nextflow.config* file. This file was added to fit nextflow implementation of **deseq2** on **Seven Bridges** platforms.
- *sb_nextflow_schema.yaml* - file contains configuration parameters that can be adjusted and optimized for execution on the Platform. See more on [Knowledge center](https://docs.cavatica.org/docs/bring-nextflow-apps-to-cavatica).
- *nextflow_schema.json* - file contains information about the type of inputs and outputs.
- *deseq2.R* - R script which runs the **deseq2** module.

To see more about files which are specific to nextflow or nf-core visit [DSL2 Modules](https://nf-co.re/docs/contributing/modules) or [Nextflow configuation files](https://www.nextflow.io/docs/latest/config.html) page.

### Test files

Test files for this tool can be found at the [Nextflow implementation of deseq2 public project](https://cavatica.sbgenomics.com/u/darko_cucin/nextflow-implementation-of-deseq2) on the CAVATICA platform. In the project description you will find information about test files. 

### Guidance to upload **Deseq2** on Seven Bridges platforms

We will list the main steps in uploading **deseq2** on Seven Bridges platforms

```
git clone https://github.com/DarkoCucin/nextflow-deseq2-repo.git
cd nextflow-deseq2-repo
sbpack_nf --profile PROFILE_NAME --appid APPID --workflow-path WORKFLOW_PATH --entrypoint ENTRYPOINT --sb-schema SB_SCHEMA
```
Visit [Knowledge center](https://docs.cavatica.org/docs/bring-nextflow-apps-to-cavatica) to learn more about *sbpack_nf* tool. 
