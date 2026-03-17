# KR260 ROS2 Setup Guide

This repository provides a simple guide and script to install **ROS2 Humble** on the **AMD KR260 Robotics Starter Kit** and verify the installation using the **TurtleSim demo**.

---

# Hardware Used

* AMD KR260 Robotics Starter Kit
* Logitech C270 USB Camera (Not Needed for turtlesim demo)

---

# Software

* Ubuntu 22.04 (running on KR260)
* ROS2 Humble

---

# Repository Structure

```
KR260-ROS2-Tutorial
│
├── Images
├── README.md
├── setup-guide
├── LICENSE
├── .gitignore
└── scripts
     └── install_ros2.sh
```

The installation script used in this tutorial is located in :

```
scripts/install_ros2.sh
```

---

# 1. Clone this Repository

First download this repository into your KR260 board.

```
git clone https://github.com/make2explore/KR260-ROS2-Tutorial
```

Move into the project directory.

```
cd KR260-ROS2-Tutorial
```

---

# 2. Prepare the KR260 Environment

Before installing ROS2 we need to activate the PYNQ environment used by KRIA.  

Activate the **PYNQ environment**:

```
sudo su
source /etc/profile.d/pynq_venv.sh
```
After this step you should see the terminal prompt change to:
```
(pynq-venv)
```
This means the KRIA environment is ready.  


---

# 3. Install ROS2

Move to the scripts folder.

```
cd scripts
```

Make the script executable.

```
chmod +x install_ros2.sh
```

Run the installation script.

```
./install_ros2.sh
```

The script will:

* Configure system locale
* Add the ROS2 repository
* Install ROS2 Humble
* Install development tools
* Install TurtleSim for testing

Installation may take **20–40 minutes** depending on network speed.

---

# 4. Verify ROS2 Installation

After installation, verify ROS2 is available:  
  
### 4.1 Load ROS2 Environment

Before using ROS2 commands, load the ROS2 environment:

```
source /opt/ros/humble/setup.bash
```
  
### 4.2 Run the help command  

```
ros2 --help
```

If ROS2 is installed correctly, you will see a list of ROS2 commands.

---

# 5. Run the TurtleSim Demo

Start the TurtleSim simulator.

```
ros2 run turtlesim turtlesim_node
```

A window with a turtle should appear.

Open **another terminal** and run:

```
ros2 run turtlesim turtle_teleop_key
```

Use the **arrow keys** to control the turtle. Or Other keys shown in terminal window for rotation etc.  
 
If the turtle moves, ROS2 is working correctly.

---

# Troubleshooting

If you get error like : ROS commands are not found, load the ROS environment manually:

```
source /opt/ros/humble/setup.bash
```

---
