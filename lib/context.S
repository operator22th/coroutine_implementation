.global coroutine_entry
coroutine_entry:
    movq %r13, %rdi
    callq *%r12

.global coroutine_switch
coroutine_switch:
    # TODO: Task 1
    # 保存 callee-saved 寄存器到 %rdi 指向的上下文
    # 保存的上下文中 rip 指向 ret 指令的地址（.coroutine_ret）

    # 从 %rsi 指向的上下文恢复 callee-saved 寄存器
    # 最后 jmpq 到上下文保存的 rip

    movq (%rsp), %rax
    movq %rax, (%rdi)
    movq %rbx, 8(%rdi)
    movq %rbp, 16(%rdi)
    movq %r12, 24(%rdi)
    movq %r13, 32(%rdi)
    movq %r14, 40(%rdi)
    movq %r15, 48(%rdi)
    movq %r11, 56(%rdi)
    movq %rbx, 72(%rdi)
    movq %rbp, 80(%rdi)
    movq %r12, 88(%rdi)
    movq %r13, 96(%rdi)
    movq %r14, 104(%rdi)
    movq %r15, 112(%rdi)
    movq (%rsp), %rax
    movq %rax, 120(%rdi)

    movq (%rsi), %rax
    movq 8(%rsi), %rdi
    movq 24(%rsi), %rdx
    movq 32(%rsi), %r8
    movq 40(%rsi), %r9
    movq 48(%rsi), %r10
    movq 56(%rsi), %r11
    movq 64(%rsi), %rsp
    movq 72(%rsi), %rbx
    movq 80(%rsi), %rbp
    movq 88(%rsi), %r12
    movq 96(%rsi), %r13
    movq 104(%rsi), %r14
    movq 112(%rsi), %r15
    leaq 8(%rsp), %rsp
    pushq 120(%rsi)
    movq 16(%rsi), %rsi

.coroutine_ret:
    ret
