> 源码范围：仅本模块 RTL、内部子模块及独立 TB；其他模块源码请进入对应工作台。`code/` 不收录联调包装、构建脚本、Makefile 或说明文件。

# TPU_CRG Design Workbench

**[Open the TPU_CRG Workbench](https://lin2513lp.github.io/TPU_CRG_WORKBENCH/TPU_CRG_WORKBENCH.html)**

Clock gating, grouped PE clocks, reset synchronization, and DFT bypass for TPU_TOP. The workbench runs in a browser and requires no installation.

## Workbench contents

- SYS_CLK_CRG enable synchronization and two-cycle clock-disable tail.
- PE_CRG clock selection for 64 groups in a 16 x 16 PE array.
- RST_SYNC asynchronous reset assertion, synchronous release, and test-mode bypass.
- Design reports, WaveDrom timing diagrams, simulation captures, and source browsing.

## Source files

[`code/`](code/) contains only this module’s RTL, internal submodules and standalone HDL testbenches. There are **7 RTL/TB files**. Other modules are available from their respective workbenches. [`source-manifest.json`](source-manifest.json) lists the retained source hashes.


## Repository layout

| Path | Contents |
| --- | --- |
| [`TPU_CRG_WORKBENCH.html`](TPU_CRG_WORKBENCH.html) | Main design workbench |
| [`code/`](code/) | This module’s RTL and independent HDL testbenches |
| [`source-manifest.json`](source-manifest.json) | Source inventory and checksums |
| [`index.html`](index.html) | English project introduction and workbench link |

## Using the project

Open the workbench to browse the design report, waveforms and this module’s RTL/TB. Run simulation in the original local project environment.

## Latest simulation update

The ICG latches the functional enable, ORs the latch output with the DFT enable, then ANDs the result with the source clock. Change the DFT enable during the low clock phase.

On 2026-10-06, QuestaSim and VM VCS regressions passed all 256 size configurations with 188,683 checks and zero errors. The normal and DFT demonstration testbenches were rerun with VCS, producing new FSDBs and all four Verdi captures. An independent waveform check passed 19,978 checks.

## Related workbenches

- [AXI_TOP](https://github.com/Lin2513lp/AXI_TOP_WORKBENCH)
- [AHB_SLAVE](https://github.com/Lin2513lp/AHB_SLAVE_WORKBENCH)
- [SA_TOP](https://github.com/Lin2513lp/sa-workbench)
- [PE_MP](https://github.com/Lin2513lp/pe-mp-workbench)
