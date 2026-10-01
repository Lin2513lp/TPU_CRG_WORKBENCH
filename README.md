# TPU_CRG Design Workbench

**[Open the TPU_CRG Workbench](https://lin2513lp.github.io/TPU_CRG_WORKBENCH/TPU_CRG_WORKBENCH.html)**

Clock gating, grouped PE clocks, reset synchronization, and DFT bypass for TPU_TOP. The workbench runs in a browser and requires no installation.

## Workbench contents

- SYS_CLK_CRG enable synchronization and two-cycle clock-disable tail.
- PE_CRG clock selection for 64 groups in a 16 x 16 PE array.
- RST_SYNC asynchronous reset assertion, synchronous release, and test-mode bypass.
- Design reports, WaveDrom timing diagrams, simulation captures, and source browsing.

## Source files

[`code/`](code/) contains the current source snapshot from the shared `TPU_CRG` project. Relative paths and file contents are preserved, including RTL, testbenches, Makefiles, file lists, and available helper scripts. The workbench's code viewer displays this same snapshot.

There are **11 project files** in this snapshot. [`source-manifest.json`](source-manifest.json) records the shared-directory mapping and SHA-256 checksums. Generated simulator databases, waveform dumps, editor temporary files, and license logs are excluded.

## Repository layout

| Path | Contents |
| --- | --- |
| [`TPU_CRG_WORKBENCH.html`](TPU_CRG_WORKBENCH.html) | Main design workbench |
| [`code/`](code/) | Shared-project source files and build entry points |
| [`source-manifest.json`](source-manifest.json) | Source inventory and checksums |
| [`index.html`](index.html) | English project introduction and workbench link |

## Using the project

Open the workbench through the link above to browse the report, code, and waveforms. For simulation, clone this repository, enter `code/`, and use its Makefile in a configured Linux EDA environment. The original tool paths and environment variables in the shared Makefile are preserved; configure these for your installation.

## Related workbenches

- [AXI_TOP](https://github.com/Lin2513lp/AXI_TOP_WORKBENCH)
- [AHB_SLAVE](https://github.com/Lin2513lp/AHB_SLAVE_WORKBENCH)
- [SA_TOP](https://github.com/Lin2513lp/sa-workbench)
- [PE_MP](https://github.com/Lin2513lp/pe-mp-workbench)
