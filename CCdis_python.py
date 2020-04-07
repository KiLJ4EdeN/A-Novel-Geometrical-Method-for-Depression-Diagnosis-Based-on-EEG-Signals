# python implementation of CCdis
# please kindly cite the article if you find these methods useful to your application.
import numpy as np

def CCdis(arr, lag=1):
  N = len(arr) - 6
  cx = np.zeros(N)
  cy = np.zeros(N)
  i = 0
  while i <= N:
    cx[i] = np.mean([arr[i], arr[i+1], arr[i+2]])
    cy[i] = np.mean([arr[i+1], arr[i+3], arr[i+5]])
    i += lag
  CCseq = np.sqrt((cx[2:]-cx[1:-1])**2 + (cy[2:]-cy[1:-1])**2);
  output = np.mean(CCseq)
  return CCseq, output

# example usage: CCseq, output = CCdis(arr, 12)
