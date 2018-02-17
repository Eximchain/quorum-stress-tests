# Test 5: Increased Size
  
## Description

Tests an even larger, multi-region network to determine if a network of this size can stand up.

## Network Properties

### Network Size
| Property             | Value |
| :------------------: | :---: |
| Number of Regions    | 14    |
| Number of Makers     | 144    |
| Number of Validators | 89    |
| Number of Observers  | 1     |

### Network Configuration
| Property                       | Value       |
| :----------------------------: | :---------: |
| Votes to Confirm Block         | 45          |
| Gas Limit Per Block            | 804247552   |
| Block Maker Minimum Block Time | 60 seconds  |
| Block Maker Maximum Block Time | 300 seconds |

### Instance Types
| Property                  | Value     |
| :-----------------------: | :-------: |
| Quorum Node Instance Type | t2.medium |
| Bootnode Instance Type    | t2.small  |

## Test Results

### Overall

**SUCCESS**

The network is still running after ~1 day of running

### Details

At any given point there are around 190 Pending transactions. There were 2 instances that emitted metrics indicating a process crash, but no further evidence of crashing was found.

### Metrics

![Test 5 Metrics](test-5-metrics.png "Test 5 Metrics")

