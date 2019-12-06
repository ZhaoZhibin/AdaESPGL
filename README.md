# AdaESPGL

This repository contains the implementation details of our paper: [IEEE Transactions on Industrial Electronics]
"[**Enhanced sparse period-group lasso for bearing fault diagnosis**](https://ieeexplore.ieee.org/abstract/document/8365091)" 
by [Zhibin Zhao](https://zhaozhibin.github.io/). 


## About
Bearing faults are one of the most common inducements for machine failures. Therefore, it is very important
to perform bearing fault diagnosis reliably and rapidly.
However, it is fundamental but difficult to extract impulses buried in heavy background noise for bearing fault diagnosis.
In this paper, a novel adaptive enhanced sparse periodgroup lasso (AdaESPGL) algorithm for bearing fault diagnosis
is proposed. The algorithm is based on the proposed enhanced sparse group lasso penalty, which promotes the
sparsity within and across groups of the impulsive feature of bearing faults. Moreover, a periodic prior is embedded and
updated dynamically through each iteration of the optimization procedure. Additionally, we formed a deterministic rule
about how to set the parameters adaptively. The main advantage over conventional sparse representation methods
is that AdaESPGL is parameter free (forming a deterministic rule) and rapid (extracting the impulsive information directly
from the time domain). Finally, the performance of AdaESPGL is verified through a series of numerical simulations
and the diagnosis of a motor bearing. Results demonstrate its superiority in extracting periodic impulses in comparison
to other state-of-the-art methods.


## Dependencies
- Matlab R2016b


## Pakages

This repository is organized as:
- [funs](https://github.com/ZhaoZhibin/AdaESPGL/tree/master/funs) contains the main functions of the algorithm.
- [util](https://github.com/ZhaoZhibin/AdaESPGL/tree/master/util) contains the extra functions of the test.
- [Results](https://github.com/ZhaoZhibin/AdaESPGL/tree/master/Results) contains the results of the algorithm.
In our implementation, **Matlab R2016b** is used to perform all the experiments.

## Implementation:
Flow the steps presented below:
-  Clone this repository.
```
git clone https://github.com/ZhaoZhibin/AdaESPGL.git
open it with matlab
```
-  Test Simulation: Check the parameters setting of simulation in `Config.m` and run `Test_simulaton.m`. 


## Citation
If you feel our AdaESPGL is useful for your research, please consider citing our paper: 

```
@article{zhao2018enhanced,
  title={Enhanced sparse period-group lasso for bearing fault diagnosis},
  author={Zhao, Zhibin and Wu, Shuming and Qiao, Baijie and Wang, Shibin and Chen, Xuefeng},
  journal={IEEE Transactions on Industrial Electronics},
  volume={66},
  number={3},
  pages={2143--2153},
  year={2018},
  publisher={IEEE}
}
```
## Contact
- zhibinzhao1993@gmail.com

