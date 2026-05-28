
#include <stdio.h>
#include <stdlib.h>


typedef struct {
	int pid;            // Process ID
	int arrival;        // Arrival Time
	int burst;          // Burst Time (Service Time)
	int start;          // Start Time
	int completion;     // Completion Time
	int turnaround;     // Turnaround Time
	int waiting;        // Waiting Time
} Process;

// Function for sorting
void swap(Process *a, Process *b) {
	Process temp = *a;
	*a = *b;
	*b = temp;
}

// Function to sort processes by arrival time (bubble sort)
void sortByArrival(Process p[], int n) {
	int i, j;
	for (i = 0; i < n - 1; i++) {
		for (j = 0; j < n - i - 1; j++) {
			if (p[j].arrival > p[j + 1].arrival) {
				swap(&p[j], &p[j + 1]);
			}
		}
	}
}

// Function to print a Gantt Chart using actual start/completion times and IDLE blocks
void printGanttChart(Process p[], int n) {
	int i, t = 0;
	printf("\nGantt Chart:\n");
	// Print top bar
	printf(" ");
	t = 0;
	for (i = 0; i < n; i++) {
		if (i == 0 && p[i].start > 0) {
			printf("------"); // IDLE block
		} else if (i > 0 && p[i].start > p[i-1].completion) {
			printf("------"); // IDLE block
		}
		printf("------"); // Process block
	}
	printf("-\n|");
	// Print process and IDLE blocks
	for (i = 0; i < n; i++) {
		if (i == 0 && p[i].start > 0) {
			printf(" IDLE |");
		} else if (i > 0 && p[i].start > p[i-1].completion) {
			printf(" IDLE |");
		}
		printf("  P%d  |", p[i].pid);
	}
	printf("\n ");
	// Print bottom bar
	for (i = 0; i < n; i++) {
		if (i == 0 && p[i].start > 0) {
			printf("------");
		} else if (i > 0 && p[i].start > p[i-1].completion) {
			printf("------");
		}
		printf("------");
	}
	printf("-\n");
	// Print time line
	t = 0;
	if (p[0].start > 0) {
		printf("%d", 0);
		printf("     %d", p[0].start);
		t = p[0].start;
	} else {
		printf("%d", p[0].start);
		t = p[0].start;
	}
	for (i = 0; i < n; i++) {
		if (i > 0 && p[i].start > p[i-1].completion) {
			printf("     %d", p[i].start);
			t = p[i].start;
		}
		printf("     %d", p[i].completion);
		t = p[i].completion;
	}
	printf("\n");
}

int main() {
	int n, i;
	float totalWT = 0, totalTAT = 0;
	int sumWT = 0, sumTAT = 0;
	float totalBurst = 0, totalTime = 0, cpuUtil = 0, throughput = 0;

	// Ask user for number of processes
	do {
		printf("Enter the number of processes (1-100): ");
		if (scanf("%d", &n) != 1 || n < 1 || n > 100) {
			printf("Invalid input. Please enter a number between 1 and 100.\n");
			while (getchar() != '\n'); // clear input buffer
			n = 0;
		}
	} while (n < 1 || n > 100);

	Process p[100];

	// Input process details
	for (i = 0; i < n; i++) {
		printf("\nProcess %d:\n", i + 1);
		printf("  Enter Process ID (integer): ");
		while (scanf("%d", &p[i].pid) != 1) {
			printf("  Invalid input. Enter an integer: ");
			while (getchar() != '\n');
		}
		printf("  Enter Arrival Time (>=0): ");
		while (scanf("%d", &p[i].arrival) != 1 || p[i].arrival < 0) {
			printf("  Invalid input. Enter a non-negative integer: ");
			while (getchar() != '\n');
		}
		printf("  Enter Burst Time (>0): ");
		while (scanf("%d", &p[i].burst) != 1 || p[i].burst <= 0) {
			printf("  Invalid input. Enter a positive integer: ");
			while (getchar() != '\n');
		}
	}

	// Sort processes by arrival time
	sortByArrival(p, n);

	// Simulate FCFS Scheduling with Start Time 
	int currentTime = 0;
	for (i = 0; i < n; i++) {
		// If CPU is idle, move time forward
		if (currentTime < p[i].arrival) {
			currentTime = p[i].arrival;
		}
		// Start time is when CPU is ready
		p[i].start = currentTime;
		// Completion time = start + burst
		p[i].completion = p[i].start + p[i].burst;
		// Turnaround time = completion - arrival
		p[i].turnaround = p[i].completion - p[i].arrival;
		// Waiting time = start - arrival
		p[i].waiting = p[i].start - p[i].arrival;
		// Update current time
		currentTime = p[i].completion;
		// Add to totals
		totalWT += p[i].waiting;
		totalTAT += p[i].turnaround;
		sumWT += p[i].waiting;
		sumTAT += p[i].turnaround;
		totalBurst += p[i].burst;
	}
	// Total execution time is completion time of last process
	totalTime = p[n-1].completion;
	// CPU Utilization and Throughput
	if (totalTime > 0) {
		cpuUtil = (totalBurst / totalTime) * 100.0f;
		throughput = n / totalTime;
	} else {
		cpuUtil = 0;
		throughput = 0;
	}

	// Print results
	printf("\nFCFS Scheduling Results:\n");
	printf("-------------------------------------------------------------------------------------------------------------\n");
	printf("| PID | Arrival Time | Burst Time | Start Time | Completion Time | Turnaround Time | Waiting Time |\n");
	printf("-------------------------------------------------------------------------------------------------------------\n");
	for (i = 0; i < n; i++) {
		printf("| %3d |     %6d    |    %6d  |   %6d   |      %6d     |      %6d      |    %6d    |\n",
			   p[i].pid, p[i].arrival, p[i].burst, p[i].start, p[i].completion, p[i].turnaround, p[i].waiting);
	}
	printf("-------------------------------------------------------------------------------------------------------------\n");


	// Step-by-step breakdown for averages
	printf("\n================ AVERAGE TIME METRICS  ================\n");

	// Average Waiting Time
	printf("\n1. AVERAGE WAITING TIME \n");
	printf("Waiting Times = ");
	for (i = 0; i < n; i++) {
		printf("%d", p[i].waiting);
		if (i < n - 1) printf(" + ");
	}
	printf("\nSum WT = %d\n", sumWT);
	printf("n = %d\n", n);
	printf("Average Waiting Time = %d / %d\n", sumWT, n);
	printf("Average Waiting Time = %.2f\n", totalWT / n);

	// Average Turnaround Time
	printf("\n2. AVERAGE TURNAROUND TIME\n");
	printf("Turnaround Times = ");
	for (i = 0; i < n; i++) {
		printf("%d", p[i].turnaround);
		if (i < n - 1) printf(" + ");
	}
	printf("\nSum TAT = %d\n", sumTAT);
	printf("n = %d\n", n);
	printf("Average Turnaround Time = %d / %d\n", sumTAT, n);
	printf("Average Turnaround Time = %.2f\n", totalTAT / n);
	printf("===================================================================\n");

	// Print Gantt Chart
	printGanttChart(p, n);


	printf("\n================ PERFORMANCE METRICS ================\n");

	// CPU Utilization
	printf("\n1. CPU UTILIZATION \n");
	printf("Total Burst Time = %.2f\n", totalBurst);
	printf("Total Time = %.2f\n", totalTime);
	printf("CPU Idle Time = %.2f\n", totalTime - totalBurst);
	printf("CPU Utilization = (Total Burst Time / Total Time) * 100\n");
	printf("CPU Utilization = (%.2f / %.2f) * 100\n", totalBurst, totalTime);
	printf("CPU Utilization = %.2f%%\n", cpuUtil);

	// Throughput
	printf("\n2. THROUGHPUT\n");
	printf("Number of Processes = %d\n", n);
	printf("Total Time = %.2f\n", totalTime);
	printf("Throughput = Number of Processes / Total Time\n");
	printf("Throughput = %d / %.2f\n", n, totalTime);
	printf("Throughput = %.2f processes/unit time\n", throughput);

	printf("=====================================================\n");

	

	// 3. RESPONSE TIME (WITH STEPS)
	int sumRT = 0;
	printf("\n3. RESPONSE TIME \n");
	printf("Response Times:\n");
	for (i = 0; i < n; i++) {
		int rt = p[i].start - p[i].arrival;
		printf("P%d: %d - %d = %d\n", p[i].pid, p[i].start, p[i].arrival, rt);
		sumRT += rt;
	}
	printf("Sum of Response Times = %d\n", sumRT);
	printf("Average Response Time = %d / %d\n", sumRT, n);
	printf("Average Response Time = %.2f\n", (float)sumRT / n);

	//cpu idle percentage
	float cpuIdle = totalTime - totalBurst;
	float cpuIdlePct = 0;
	if (totalTime > 0) cpuIdlePct = (cpuIdle / totalTime) * 100.0f;
	printf("\n4. CPU IDLE PERCENTAGE \n");
	printf("CPU Idle Time = %.2f\n", cpuIdle);
	printf("Total Time = %.2f\n", totalTime);
	printf("CPU Idle %% = (CPU Idle Time / Total Time) * 100\n");
	printf("CPU Idle %% = (%.2f / %.2f) * 100\n", cpuIdle, totalTime);
	printf("CPU Idle %% = %.2f%%\n", cpuIdlePct);

	printf("===============================================================\n");

	return 0;
}

