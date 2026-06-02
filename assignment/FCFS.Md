

## FCFS Scheduling Simulator — Project Description

### Project Title
First-Come, First-Served (FCFS) CPU Scheduling Simulator in C

### Objective
Implement an interactive CPU scheduling simulator that models the FCFS algorithm for processes with arrival and burst times. The program calculates scheduling metrics, visualizes execution order with a Gantt chart, and helps students understand how arrival order and idle time affect CPU performance.

### Functionality
- Reads input for up to 100 processes.
- For each process, accepts:
  - Process ID
  - Arrival time
  - Burst time
- Sorts processes by arrival time.
- Simulates non-preemptive FCFS execution.
- Handles CPU idle intervals when no process has arrived yet.
- Computes and displays:
  - Start time
  - Completion time
  - Turnaround time
  - Waiting time
  - Response time
- Calculates performance metrics:
  - Average waiting time
  - Average turnaround time
  - Average response time
  - CPU utilization
  - Throughput
  - CPU idle percentage

### Design and Implementation
- Uses a `Process` struct to store process details.
- Sorts processes using a simple bubble sort by arrival time.
- Simulates scheduling in a single pass:
  - If CPU is idle, current time jumps to next arrival.
  - Start time = current CPU time.
  - Completion time = start time + burst time.
  - Turnaround = completion - arrival.
  - Waiting = start - arrival.
- Totals burst time and total execution time to compute utilization and throughput.
- Builds a text-based Gantt chart that includes `IDLE` periods when appropriate.
- Prints a formatted results table and step-by-step average time calculations.

### User Interaction
1. Prompt for number of processes.
2. Prompt process-by-process for PID, arrival time, and burst time.
3. Output scheduling results and metrics in a readable table.
4. Display the Gantt chart and performance calculations.

### Educational Value
- Demonstrates the core behavior of FCFS scheduling.
- Illustrates how process arrival order affects waiting and turnaround.
- Shows the impact of idle CPU time on utilization.
- Reinforces formulas for turnaround, waiting, and response times.
- Helps compare scheduling quality through throughput and utilization.

### Example Outputs
- A schedule table showing each process’s arrival, burst, start, completion, turnaround, and waiting time.
- A Gantt chart showing execution sequence and idle slots.
- Average times and throughput calculations with explicit formulas.

### Notes
- The implementation is straightforward and suitable for an OS lab assignment.
- It is non-preemptive and assumes processes are executed in order of arrival.
- The program performs input validation for process count, arrival time, and burst time.

### Possible Extensions
- Add support for other scheduling algorithms (SJF, Round Robin, Priority).
- Accept process data from a file.
- Improve sorting and stability for equal arrival times.
- Add graphical or timeline-based visualization.

This project is a practical FCFS scheduling simulator that teaches operating systems concepts and provides concrete performance metrics for process scheduling behavior.