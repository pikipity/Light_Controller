Light Controller
================

使用 Arduino 来控制一个 LED 灯的亮度。

使用 Processing 编写的可视化控制条，用户可以通过拉拽控制条来调整亮度的数值，通过串口将亮度输送给 Arduino，由 Arduino 实现 LED 灯亮度的调整。

已经测试成功。

Note: 根据不同电脑配置的不同，processing 中串口端口可能需要修改。根据选择的 Arduino 中选择的端口的顺序修改 Program.pde 中的第24行的数字即可，由于我的电脑 Macbook Pro 使用的是第4个串口，所以是```String PortName=Serial.list()[4];```。

程序截图：

![程序截图](https://lh6.googleusercontent.com/-IHYJhlfZPoc/UixyaVzcbYI/AAAAAAAABIM/jEakPgrxBqA/s800/%25E5%25B1%258F%25E5%25B9%2595%25E5%25BF%25AB%25E7%2585%25A7%25202013-09-08%2520%25E4%25B8%258B%25E5%258D%25888.03.49.png)

硬件连接：

![硬件连接](https://lh6.googleusercontent.com/-agA7VbMa52g/UixyanVbgEI/AAAAAAAABIU/pfmOdBwHGrc/s640/%25E7%2585%25A7%25E7%2589%2587%252013-9-8%2520%25E4%25B8%258B%25E5%258D%25888%252001%252036.jpg)
