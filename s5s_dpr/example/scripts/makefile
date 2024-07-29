
TB_DIR           = ${S5S_UVM_TEST}/s5s_dpr/example/

VERBOSITY        = UVM_HIGH
EXTRA_OPTS       = +UVM_VERBOSITY=${VERBOSITY}
TEST             = example_dpr_10_trans_test
COV              =
MODE             = -gui -linedebug -uvmlinedebug


COMPILE_RESULT   = ${TB_DIR}/rundir/compile.log
COMPILE_COMMAND  = xrun -64bit -uvm -f ${TB_DIR}/file_list/compile.f +access+rwc +timescale=1ns/100ps -c -l ${COMPILE_RESULT} -disable_sem2009 -linedebug -uvmlinedebug
RUN_RESULT       = ${TB_DIR}/rundir/run.log
RUN_COMMAND      = xrun -64bit -R -l ${RUN_RESULT} ${MODE}  +UVM_TESTNAME=${TEST} ${EXTRA_OPTS}

ifneq (${COV},)
  COMPILE_COMMAND += -covdut top -covfile ${TB_DIR}/scripts/cov_file
  RUN_COMMAND     += -covworkdir ${TB_DIR}/rundir/cov_dir -covoverwrite -covtest ${TEST}
endif


${COMPILE_RESULT}:
	${COMPILE_COMMAND}

compile: ${COMPILE_RESULT}

.PHONY:${RUN_RESULT}
${RUN_RESULT}: ${COMPILE_RESULT}
	${RUN_COMMAND}

run: ${RUN_RESULT}


clean:
	rm -rf `ls --ignore=makefile --ignore=.default --almost-all`

