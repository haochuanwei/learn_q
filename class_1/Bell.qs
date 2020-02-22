namespace Quantum.Bell {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Set(desired : Result, q1 : Qubit) : Unit {
        if (desired != M(q1)) {
            X(q1);
        }
    }

    operation TestSingleBellState(count : Int, initial : Result, flip : Bool, superposition : Bool) : (Int, Int) {
    
        mutable numOnes = 0;
        using (qubit = Qubit()) {
    
            for (test in 1..count) {
                Set(initial, qubit);

                // flip the qubit if instructed to
                if (flip) {
                    X(qubit);
                }

                // apply Hadamard if instructed to
                if (superposition) {
                    H(qubit);
                }

                let res = M(qubit);
    
                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }
            Set(Zero, qubit);
        }
    
        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count-numOnes, numOnes);
    }

    operation TestEntangledBellState(count : Int, initial : Result) : (Int, Int, Int) {
    
        mutable numOnes = 0;
        mutable agree = 0;
        using ((q0, q1) = (Qubit(), Qubit())) {
    
            for (test in 1..count) {
                Set(initial, q0);
                Set(Zero, q1);

                H(q0);
                CNOT(q0, q1);
                let res = M(q0);

                // Count the number of agreements between the two qubits
                if (M(q1) == res) {
                    set agree += 1;
                }

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }
            Set(Zero, q0);
            Set(Zero, q1);
        }
    
        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count-numOnes, numOnes, agree);
    }
}
