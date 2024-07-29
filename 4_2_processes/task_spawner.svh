
`ifndef __TASK_SPAWNER__SVH
`define __TASK_SPAWNER__SVH

class task_spawner extends uvm_component;
  `uvm_component_utils(task_spawner)

  uvm_event m_evt;

  function new(string name = "task_spawner", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_evt = new("m_evt");
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    fork
      task_a();
      task_b();
    join
  endtask : run_phase

  virtual task task_a();
    forever begin
      #4;
      m_evt.trigger();
      m_evt.wait_trigger();
    end
  endtask : task_a

  virtual task task_b();
    forever begin
      m_evt.wait_trigger();
      #2;
      m_evt.trigger();
    end
  endtask : task_b

endclass : task_spawner

`endif //__TASK_SPAWNER__SVH



