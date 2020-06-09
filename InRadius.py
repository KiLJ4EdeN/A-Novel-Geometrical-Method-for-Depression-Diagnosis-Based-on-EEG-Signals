def in_radius(signal, lag=6):
    n = len(signal) - 6
    r = []
    for m in range(n):

        a = sqrt((signal[m] - signal[m + 2]) ** 2 + (signal[m + 1] - signal[m + 3]) ** 2)
        b = sqrt((signal[m] - signal[m + 4]) ** 2 + (signal[m + 1] - signal[m + 5]) ** 2)
        c = sqrt((signal[m + 2] - signal[m + 4]) ** 2 + (signal[m + 3] - signal[m + 5]) ** 2)

        if a + b + c == 0:
            r = 0
        else:
            s = (a + b + c) / 2
            area = (s * (s - a) * (s - b) * (s - c))
            # change this later
            area = sqrt(area)
            r.append((2 * area) / (a + b + c))
    return r[::lag]
