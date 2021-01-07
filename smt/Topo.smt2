; SMT-LIBv2 description generated by firrtl 1.4-SNAPSHOT for module Topo.
(set-logic QF_UFBV)
(set-option :produce-models true)

(declare-sort Topo_s 0)
; firrtl-smt2-input reset 1
(declare-fun reset_f (Topo_s) Bool)
; firrtl-smt2-input io_in1 16
(declare-fun io_in1_f (Topo_s) (_ BitVec 16))
; firrtl-smt2-input io_in2 16
(declare-fun io_in2_f (Topo_s) (_ BitVec 16))
; firrtl-smt2-register reg 16
; @ Topo.scala 20:16, Topo.scala 21:7
(declare-fun reg_f (Topo_s) (_ BitVec 16))
; firrtl-smt2-wire _T 4
; @ Topo.scala 18:19
(define-fun _T_f ((state_0 Topo_s)) (_ BitVec 4) 
	(bvadd 
		(_ bv1 4) 
		(_ bv1 4)))
; firrtl-smt2-wire _T_1 3
; @ Topo.scala 18:19
(define-fun _T_1_f ((state_0 Topo_s)) (_ BitVec 3) 
	((_ extract 2 0) 
		(_T_f state_0)))
; firrtl-smt2-wire _T_2 1
; @ Topo.scala 18:30
(define-fun _T_2_f ((state_0 Topo_s)) Bool 
	(= 
		(_T_1_f state_0) 
		(_ bv2 3)))
; firrtl-smt2-wire _T_3 4
; @ Topo.scala 19:19
(define-fun _T_3_f ((state_0 Topo_s)) (_ BitVec 4) 
	(bvadd 
		(_ bv2 4) 
		(_ bv1 4)))
; firrtl-smt2-wire _T_4 3
; @ Topo.scala 19:19
(define-fun _T_4_f ((state_0 Topo_s)) (_ BitVec 3) 
	((_ extract 2 0) 
		(_T_3_f state_0)))
; firrtl-smt2-wire _T_5 1
; @ Topo.scala 19:30
(define-fun _T_5_f ((state_0 Topo_s)) Bool 
	(= 
		(_T_4_f state_0) 
		(_ bv3 3)))
; firrtl-smt2-wire _T_6 17
; @ Topo.scala 21:17
(define-fun _T_6_f ((state_0 Topo_s)) (_ BitVec 17) 
	(bvadd 
		((_ zero_extend 1) 
			(io_in1_f state_0)) 
		((_ zero_extend 1) 
			(io_in2_f state_0))))
; firrtl-smt2-wire _T_7 16
; @ Topo.scala 21:17
(define-fun _T_7_f ((state_0 Topo_s)) (_ BitVec 16) 
	((_ extract 15 0) 
		(_T_6_f state_0)))
; firrtl-smt2-output io_out 16
; @ Topo.scala 23:10
(define-fun io_out_f ((state_0 Topo_s)) (_ BitVec 16) 
	(reg_f state_0))
; firrtl-smt2-wire _T_8 16
; @ Topo.scala 24:19
(define-fun _T_8_f ((state_0 Topo_s) (state_1 Topo_s)) (_ BitVec 16) 
	(io_out_f state_1))
; firrtl-smt2-wire _T_9 1
; @ Topo.scala 24:23
(define-fun _T_9_f ((state_0 Topo_s) (state_1 Topo_s)) Bool 
	(bvuge 
		(_T_8_f state_0 state_1) 
		(io_in1_f state_0)))
; firrtl-smt2-assert assert_combinatorial_0 1
; @ Topo.scala 18:9
(define-fun assert_combinatorial_0_f ((state_0 Topo_s)) Bool 
	(_T_2_f state_0))
; firrtl-smt2-assert assert_combinatorial_1 1
; @ Topo.scala 19:9
(define-fun assert_combinatorial_1_f ((state_0 Topo_s)) Bool 
	(_T_5_f state_0))
; firrtl-smt2-assert assert_BoundedModelCheck_2 1
; @ Topo.scala 24:9
(define-fun assert_BoundedModelCheck_2_f ((state_0 Topo_s) (state_1 Topo_s)) Bool 
	(_T_9_f state_0 state_1))
(define-fun reg_next ((state_0 Topo_s)) (_ BitVec 16) 
	(_T_7_f state_0))
; This function evaluates to ’true’ if the states ’state’ and
; ’next_state’ form a valid state transition."
(define-fun Topo_t ((state Topo_s) (state_n Topo_s)) Bool 
	(= 
		(reg_f state_n) 
		(reg_next state)))
; This function must be asserted ’true’ for initial states. For
; non-initial states it must be left unconstrained.
(define-fun Topo_i ((state_0 Topo_s)) Bool 
	true)
; This function evaluates to ’true’ if all assertions hold in the state.
(define-fun Topo_a ((state_0 Topo_s) (state_1 Topo_s)) Bool 
	(and 
		(and 
			(assert_combinatorial_0_f state_0) 
			(assert_combinatorial_1_f state_0)) 
		(assert_BoundedModelCheck_2_f state_0 state_1)))
; This function evaluates to ’true’ if all assumptions hold in the state.
(define-fun Topo_u ((state_0 Topo_s)) Bool 
	true)


;  Combinatorial 
(push 1)
(declare-fun assert_combinatorial_0 () Topo_s)
(assert 
	(Topo_u assert_combinatorial_0))
(assert 
	(not 
		(reset_f assert_combinatorial_0)))
; Assume the dependencies
(assert 
	(not 
		(assert_combinatorial_0_f assert_combinatorial_0)))
(echo "Checking assert_combinatorial_0")
(check-sat)
(pop 1)




;  Combinatorial 
(push 1)
(declare-fun assert_combinatorial_1 () Topo_s)
(assert 
	(Topo_u assert_combinatorial_1))
(assert 
	(not 
		(reset_f assert_combinatorial_1)))
; Assume the dependencies
(assert 
	(assert_combinatorial_0_f assert_combinatorial_1))
(assert 
	(not 
		(assert_combinatorial_1_f assert_combinatorial_1)))
(echo "Checking assert_combinatorial_1")
(check-sat)
(pop 1)


(push 1)
(declare-fun state_0 () Topo_s)
(declare-fun state_1 () Topo_s)
(assert 
	(Topo_u state_0))
(assert 
	(Topo_u state_1))
(assert 
	(not 
		(reset_f state_0)))
(assert 
	(not 
		(reset_f state_1)))
(assert 
	(Topo_t state_0 state_1))
; Assume the dependencies
(assert 
	(assert_combinatorial_0_f state_0))
(assert 
	(assert_combinatorial_0_f state_1))
(assert 
	(assert_combinatorial_1_f state_0))
(assert 
	(assert_combinatorial_1_f state_1))
(assert 
	(not 
		(assert_BoundedModelCheck_2_f state_0 state_1)))
(echo "Checking assert_BoundedModelCheck_2")
(check-sat)
(get-value ((io_in1_f state_0) (io_in1_f state_1)))
(get-value ((reg_f state_0) (reg_f state_1)))
(pop 1)