# LoFT v 1.0.2

  LoFT presents a Low-order modelling of floating offshore wind turbines (FOWTs)/ farms. The main purposes are threefold:
1. Establish the low-order modelling and fast simulations of numerous FOWTs.
2. Faciliate the grid intergration research in floating offshore wind farms.
3. Support the deep reinforcement learning training 



## Brief Summary
   The basic motivation behind LoFT is to provide a tool to support the grid integration research of floating offshore wind farms. To achieve this, we need to put computational efficiency in the first place since the grid integration research requires simulating large amounts of FOWTs. As a result, LoFT  only reservs the degrees of freedom that notably influence the power output of FOWTs. 
   
   
   Moreover, another purpose of LoFT is to facilitate the deep reinforcement learning (DRL) training. To achieve this, LoFT introduces **_domain randomization_** , which is considered as the key source of robustness of a deep reinforcement learing scheme to transfer from simulations to the real world. Specifically, instead of repeating a certain scenario,
 domain randomization diversifies the simulation by imposing  as many sets of scenarios as possible. In this way, the domain of the simulated dynamics is enlarged so that it can fully cover the real dynamics, and the resilience of a DRL scheme against challenging environments and model mismatch is improved. Through domain randomization, the trained agent is able to generaliza to full-order models in [OpenFast/Fast.Farm](https://github.com/OpenFAST), or even a real-world wind farm


<!-- your comment goes here <div align=center>
     <img src="Results/Figure/wavefield.gif" height="200"/> <img src="Results/Figure/windfield.gif" height="200"/> 
</div>-->


## Quick Use
run '[Example1.m](Example1.m)' to change environment settings and simulate 5 FOWTs.

run '[Example2.m](Example2.m)' to simulate 70 FOWTs considering wake effect.

run '[Example3.m](Example3.m)' to simulate 2 floating wind farms connected with IEEE 39-bus system, as shown in Fig. 1.

Please refer to '[Documentation.pdf](Documentation.pdf)' for more details on the modelling, control, and validation in LoFT.

<div align=center>
     <img src="Results/Figure/IEEE 39 bus.png" height="550"/> 
</div>
<div align=center>
      Fig. 1. The modified IEEE 39-bus system 
</div>

## Project Organization
- PG = project-generated
- HW = human-writable
- RO = read only
```
.
├── .gitignore
├── LICENSE.md
├── README.md
├── Function                    <- All project functions (HW)  
├── Param                       <- All project parameters
│   ├── IEA 15 MW               <- IEA 15 MW semi-submersible FOWT parameters. (RO)
│   ├── IEA 22 MW               <- IEA 22 MW semi-submersible FOWT parameters. (RO)
├── Simulink                    <- Simulink models (HW)
├── Results         
│   └── figures                 <- Figures for the manuscript or documentation (PG)
├── TurboPark                   <- Averaged wind field modelling (HW)
├── Validation                  <- Validation against OpenFast (PG) 


```
## Credit

[1]	[M. Mei](https://scholar.google.com/citations?user=jpXmO2UAAAAJ&hl=zh-CN), [P. Kou](https://gr.xjtu.edu.cn/en/web/koupeng), [Z. Zhang](https://scholar.google.com/citations?hl=zh-CN&user=Qfr4gA4AAAAJ), [Y. Zhang](https://scholar.google.com/citations?hl=zh-CN&user=1cSO8eAAAAAJ), Z. Xue, and D. Liang, “Primary frequency response of floating offshore wind turbines via deep reinforcement learning and domain randomization,” _IEEE Trans. Sustain. Energy_, early access, Mar. 27, 2025, [doi: 10.1109/TSTE.2025.3555266](https://ieeexplore.ieee.org/document/10944502).

## Acknowledgement
This work was supported by the National Natural Science Foundation of China under Grant 52077165. (Principle investigator: [Peng Kou](https://gr.xjtu.edu.cn/en/web/koupeng))

## License
This project is licensed under the terms of the [Apache License Version 2.0](LICENSE.txt)
