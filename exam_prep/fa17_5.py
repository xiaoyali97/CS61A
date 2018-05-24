from ucb import trace

#@trace
def confirmer(code):
    """Return a confirming function for CODE.

    >>> confirmer(204)(2)(0)(4) # The digits of 204 are 2, then 0, then 4.
    True
    >>> confirmer(204)(2)(0)(0) # The third digit of 204 is not 0.
    False
    >>> confirmer(204)(2)(1) # The second digit of 204 is not 1.
    False
    >>> confirmer(204)(20) # The first digit of 204 is not 20.
    False
    """
    def confirm1(d, t):
        def result(digit):
            if d == digit:
                return t
            else:
                return False
        return result

    def extend(prefix, rest):
        """Return a confirming function that returns REST when given the digits of PREFIX.
        For example, if c = extend(12, confirmer(34)), then c(1)(2) returns confirmer(34),
        so that c is a confirming function for 1234."""

        left, last = prefix // 10, prefix % 10

        if left == 0:

            return confirm1(last, rest)

        else:

            return extend(left, confirm1(last, rest)) #extend(left, comfirmer(last))

    return extend(code, True)
