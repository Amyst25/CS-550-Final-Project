; SMT-LIBv2 description generated by firrtl 1.4-SNAPSHOT for module Pipeline.
(set-logic QF_UFBV)
(set-option :produce-models true)

(declare-sort Pipeline_s 0)
; firrtl-smt2-input reset 1
(declare-fun reset_f (Pipeline_s) Bool)
; firrtl-smt2-input io_in_a 8
(declare-fun io_in_a_f (Pipeline_s) (_ BitVec 8))
; firrtl-smt2-input io_in_b 8
(declare-fun io_in_b_f (Pipeline_s) (_ BitVec 8))
; firrtl-smt2-register a_2_reg 16
; @ Pipeline.scala 13:24, Pipeline.scala 13:24, Pipeline.scala 13:24, Pipeline.scala 18:11
(declare-fun a_2_reg_f (Pipeline_s) (_ BitVec 16))
; firrtl-smt2-register b_2_reg 16
; @ Pipeline.scala 14:24, Pipeline.scala 14:24, Pipeline.scala 14:24, Pipeline.scala 19:11
(declare-fun b_2_reg_f (Pipeline_s) (_ BitVec 16))
; firrtl-smt2-wire _T_9 17
; @ Pipeline.scala 21:21
(define-fun _T_9_f ((state_0 Pipeline_s)) (_ BitVec 17) 
	(bvadd 
		((_ zero_extend 1) 
			(a_2_reg_f state_0)) 
		((_ zero_extend 1) 
			(b_2_reg_f state_0))))
; firrtl-smt2-output io_out 17
; @ Pipeline.scala 21:10
(define-fun io_out_f ((state_0 Pipeline_s)) (_ BitVec 17) 
	(_T_9_f state_0))
; firrtl-smt2-wire _T 17
; @ Pipeline.scala 16:19
(define-fun _T_f ((state_0 Pipeline_s) (state_1 Pipeline_s)) (_ BitVec 17) 
	(io_out_f state_1))
; firrtl-smt2-wire _T_1 17
; @ Pipeline.scala 16:25
(define-fun _T_1_f ((state_0 Pipeline_s) (state_1 Pipeline_s) (state_2 Pipeline_s)) (_ BitVec 17) 
	(_T_f state_1 state_2))
; firrtl-smt2-wire _T_2 16
; @ Pipeline.scala 16:42
(define-fun _T_2_f ((state_0 Pipeline_s)) (_ BitVec 16) 
	(bvmul 
		((_ zero_extend 8) 
			(io_in_a_f state_0)) 
		((_ zero_extend 8) 
			(io_in_a_f state_0))))
; firrtl-smt2-wire _T_3 16
; @ Pipeline.scala 16:63
(define-fun _T_3_f ((state_0 Pipeline_s)) (_ BitVec 16) 
	(bvmul 
		((_ zero_extend 8) 
			(io_in_b_f state_0)) 
		((_ zero_extend 8) 
			(io_in_b_f state_0))))
; firrtl-smt2-wire _T_4 17
; @ Pipeline.scala 16:52
(define-fun _T_4_f ((state_0 Pipeline_s)) (_ BitVec 17) 
	(bvadd 
		((_ zero_extend 1) 
			(_T_2_f state_0)) 
		((_ zero_extend 1) 
			(_T_3_f state_0))))
; firrtl-smt2-wire _T_5 17
; @ Pipeline.scala 16:76
(define-fun _T_5_f ((state_0 Pipeline_s) (state_1 Pipeline_s)) (_ BitVec 17) 
	(_T_4_f state_1))
; firrtl-smt2-wire _T_6 1
; @ Pipeline.scala 16:29
(define-fun _T_6_f ((state_0 Pipeline_s) (state_1 Pipeline_s) (state_2 Pipeline_s)) Bool 
	(= 
		(_T_1_f state_0 state_1 state_2) 
		(_T_5_f state_0 state_1)))
; firrtl-smt2-wire _T_7 16
; @ Pipeline.scala 18:22
(define-fun _T_7_f ((state_0 Pipeline_s)) (_ BitVec 16) 
	(bvmul 
		((_ zero_extend 8) 
			(io_in_a_f state_0)) 
		((_ zero_extend 8) 
			(io_in_a_f state_0))))
; firrtl-smt2-wire _T_8 16
; @ Pipeline.scala 19:22
(define-fun _T_8_f ((state_0 Pipeline_s)) (_ BitVec 16) 
	(bvmul 
		((_ zero_extend 8) 
			(io_in_b_f state_0)) 
		((_ zero_extend 8) 
			(io_in_b_f state_0))))
; firrtl-smt2-assert assert_BoundedModelCheck_0 1
; @ Pipeline.scala 16:9
(define-fun assert_BoundedModelCheck_0_f ((state_0 Pipeline_s) (state_1 Pipeline_s) (state_2 Pipeline_s)) Bool 
	(_T_6_f state_0 state_1 state_2))
(define-fun a_2_reg_next ((state_0 Pipeline_s)) (_ BitVec 16) 
	(ite 
		(reset_f state_0) 
		(_ bv0 16) 
		(_T_7_f state_0)))
(define-fun b_2_reg_next ((state_0 Pipeline_s)) (_ BitVec 16) 
	(ite 
		(reset_f state_0) 
		(_ bv0 16) 
		(_T_8_f state_0)))
; This function evaluates to ’true’ if the states ’state’ and
; ’next_state’ form a valid state transition."
(define-fun Pipeline_t ((state Pipeline_s) (state_n Pipeline_s)) Bool 
	(and 
		(= 
			(a_2_reg_f state_n) 
			(a_2_reg_next state)) 
		(= 
			(b_2_reg_f state_n) 
			(b_2_reg_next state))))
; This function must be asserted ’true’ for initial states. For
; non-initial states it must be left unconstrained.
(define-fun Pipeline_i ((state_0 Pipeline_s)) Bool 
	true)
; This function evaluates to ’true’ if all assertions hold in the state.
(define-fun Pipeline_a ((state_0 Pipeline_s) (state_1 Pipeline_s) (state_2 Pipeline_s)) Bool 
	(assert_BoundedModelCheck_0_f state_0 state_1 state_2))
; This function evaluates to ’true’ if all assumptions hold in the state.
(define-fun Pipeline_u ((state_0 Pipeline_s)) Bool 
	true)
(push 1)
(declare-fun state_0 () Pipeline_s)
(declare-fun state_1 () Pipeline_s)
(declare-fun state_2 () Pipeline_s)
(assert 
	(Pipeline_u state_0))
(assert 
	(Pipeline_u state_1))
(assert 
	(Pipeline_u state_2))
(assert 
	(not 
		(reset_f state_0)))
(assert 
	(not 
		(reset_f state_1)))
(assert 
	(not 
		(reset_f state_2)))
(assert 
	(Pipeline_t state_0 state_1))
(assert 
	(Pipeline_t state_1 state_2))
; Assume the dependencies
(assert 
	(not 
		(assert_BoundedModelCheck_0_f state_0 state_1 state_2)))
(echo "Checking assert_BoundedModelCheck_0")
(check-sat)
(get-value ((io_in_a_f state_0) (io_in_a_f state_1) (io_in_a_f state_2)))
(get-value ((io_in_b_f state_0) (io_in_b_f state_1) (io_in_b_f state_2)))
(get-value ((a_2_reg_f state_0) (a_2_reg_f state_1) (a_2_reg_f state_2)))
(get-value ((b_2_reg_f state_0) (b_2_reg_f state_1) (b_2_reg_f state_2)))
(pop 1)