# python implementation of Cen45
# please kindly cite the article if you find these methods useful to your application.
def Cen45(arr, lag=1):
  N = len(arr) - 6
  cx = np.zeros(N)
  cy = np.zeros(N)
  i = 0
  while i <= N:
    cx[i] = np.mean([arr[i], arr[i+1], arr[i+2]])
    cy[i] = np.mean([arr[i+1], arr[i+3], arr[i+5]])
    CenSeq[i] = (np.abs(cx[i] - cy[i]) / sqrt(2));
    i += lag
  output = np.mean(CenSeq)
  return CenSeq, output

CenSeq, output = CCdis(y, 5)
