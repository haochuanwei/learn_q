import qsharp
from qsharp import Result
from Quantum.Bell import TestSingleBellState, TestEntangledBellState
from wasabi import msg as logger

def single_bell(initials=(Result.Zero, Result.One), count=1000):
    '''
    Run single-qubit Bell tests.
    '''
    logger.divider("Single Bell State")
    for flip in [False, True]:
        for hadamard in [False, True]:
            logger.divider(f'Param | Flip: {flip}; Hadamard: {hadamard}', '-')

            for i in initials:
                res = TestSingleBellState.simulate(count=count, initial=i, flip=flip, superposition=hadamard)
                (num_zeros, num_ones) = res
                logger.good(f'Init:{i: <4} 0s={num_zeros: <4} 1s={num_ones: <4}')


def entangled_bell(initials=(Result.Zero, Result.One), count=1000):
    '''
    Run two-qubit entangled Bell tests.
    '''
    logger.divider("Entangled Bell State")
    for i in initials:
        res = TestEntangledBellState.simulate(count=count, initial=i)
        (num_zeros, num_ones, agree) = res

        if agree == count:
            logger.good(f'Init:{i: <4} 0s={num_zeros: <4} 1s={num_ones: <4} agree={agree: <4}')
        else:
            logger.fail(f'Expected {count} agreements, got {agree}')

if __name__ == '__main__':
    single_bell()
    entangled_bell()
