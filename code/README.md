# TPU_CRG

目录结构与相邻 AXI 子工程一致：`rtl/`、`tb/`、`scripts/`、`results/`。
`rtl/` 包含四个设计模块和必需的 `crg_icg.sv`；`tb/` 只包含两个简单激励 TB。

在虚拟机桌面终端进入本目录，修改总 Makefile 顶部，仅保留一行 ACTIVE_TEST：

```make
ACTIVE_TEST := normal
# ACTIVE_TEST := dft
```

```bash
make all
make verdi
```

临时切换也可以使用 `make all TEST=dft`，随后使用 `make verdi TEST=dft`。
normal 为正常模式，dft 为先打开所有门控时钟，再选择并断言 DFT 复位。
TB 不包含自检 task/function；DONE 表示激励执行结束，不表示完整功能签核。

VCS 编译和调试数据库位于虚拟机本地 `~/tpu_crg_runs/TPU_CRG/build/<test>/`，
避免 VMware 共享文件夹不支持符号链接的问题。
FSDB 位于 `~/tpu_crg_runs/TPU_CRG/waves/`，同时复制到本工程的
`results/normal/` 或 `results/dft/`，编译和仿真日志也会复制到相应目录。
`make verdi` 根据当前选择打开对应的 FSDB 和 VCS 调试数据库。

在 DFT 模式下，测试复位拉低应使 `tpu_rst_n` 立即变为 0；
只要 `dft_glb_gt_se=1`，系统时钟和全部 PE 时钟就继续运行。
正常模式复位异步断言，经过两个 sys_clk 上升沿同步释放。

ICG 仅锁存功能使能；DFT 使能在锁存器之后相或。dft_glb_gt_se 须在 sys_clk 低相位切换，或保持稳定。
