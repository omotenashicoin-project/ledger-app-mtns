
bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0d00000 <main>:
    .flags = COIN_FLAGS,
#endif // COIN_FLAGS
    .kind = COIN_KIND,
};

__attribute__((section(".boot"))) int main(int arg0) {
c0d00000:	b570      	push	{r4, r5, r6, lr}
c0d00002:	b0a2      	sub	sp, #136	; 0x88
#ifdef USE_LIB_BITCOIN
    // in RAM allocation (on stack), to allow simple simple traversal into the
    // bitcoin app (separate NVRAM zone)
    unsigned int libcall_params[3];
    unsigned char coinid[sizeof(COIN_COINID)];
    strcpy(coinid, COIN_COINID);
c0d00004:	4825      	ldr	r0, [pc, #148]	; (c0d0009c <main+0x9c>)
c0d00006:	4478      	add	r0, pc
c0d00008:	ac1b      	add	r4, sp, #108	; 0x6c
c0d0000a:	4621      	mov	r1, r4
c0d0000c:	c82c      	ldmia	r0!, {r2, r3, r5}
c0d0000e:	c12c      	stmia	r1!, {r2, r3, r5}
c0d00010:	8802      	ldrh	r2, [r0, #0]
c0d00012:	7880      	ldrb	r0, [r0, #2]
c0d00014:	7088      	strb	r0, [r1, #2]
c0d00016:	800a      	strh	r2, [r1, #0]
c0d00018:	ad19      	add	r5, sp, #100	; 0x64
c0d0001a:	2000      	movs	r0, #0
    unsigned char name[sizeof(COIN_COINID_NAME)];
    strcpy(name, COIN_COINID_NAME);
c0d0001c:	7128      	strb	r0, [r5, #4]
c0d0001e:	491d      	ldr	r1, [pc, #116]	; (c0d00094 <main+0x94>)
c0d00020:	9119      	str	r1, [sp, #100]	; 0x64
c0d00022:	ae17      	add	r6, sp, #92	; 0x5c
    unsigned char name_short[sizeof(COIN_COINID_SHORT)];
    strcpy(name_short, COIN_COINID_SHORT);
c0d00024:	7130      	strb	r0, [r6, #4]
c0d00026:	481c      	ldr	r0, [pc, #112]	; (c0d00098 <main+0x98>)
c0d00028:	9017      	str	r0, [sp, #92]	; 0x5c
c0d0002a:	a80d      	add	r0, sp, #52	; 0x34
#ifdef COIN_NATIVE_SEGWIT_PREFIX
    unsigned char native_segwit_prefix[sizeof(COIN_NATIVE_SEGWIT_PREFIX)];
    strcpy(native_segwit_prefix, COIN_NATIVE_SEGWIT_PREFIX);
#endif
    btchip_altcoin_config_t coin_config;
    os_memmove(&coin_config, &C_coin_config, sizeof(coin_config));
c0d0002c:	491c      	ldr	r1, [pc, #112]	; (c0d000a0 <main+0xa0>)
c0d0002e:	4479      	add	r1, pc
c0d00030:	2228      	movs	r2, #40	; 0x28
c0d00032:	f000 f859 	bl	c0d000e8 <os_memmove>
#ifdef TARGET_BLUE
    coin_config.header_text = header;
    coin_config.color_header = COIN_COLOR_HDR;
    coin_config.color_dashboard = COIN_COLOR_DB;
#endif // TARGET_BLUE
    coin_config.coinid = coinid;
c0d00036:	a80f      	add	r0, sp, #60	; 0x3c
c0d00038:	c070      	stmia	r0!, {r4, r5, r6}
c0d0003a:	ac01      	add	r4, sp, #4
    coin_config.name_short = name_short;
#ifdef COIN_NATIVE_SEGWIT_PREFIX
    coin_config.native_segwit_prefix = native_segwit_prefix;
#endif // #ifdef COIN_NATIVE_SEGWIT_PREFIX
    BEGIN_TRY {
        TRY {
c0d0003c:	4620      	mov	r0, r4
c0d0003e:	f000 f8ad 	bl	c0d0019c <setjmp>
c0d00042:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d00044:	0400      	lsls	r0, r0, #16
c0d00046:	d111      	bne.n	c0d0006c <main+0x6c>
c0d00048:	a801      	add	r0, sp, #4
c0d0004a:	f000 f89b 	bl	c0d00184 <try_context_set>
c0d0004e:	900b      	str	r0, [sp, #44]	; 0x2c
c0d00050:	200a      	movs	r0, #10
            // ensure syscall will accept us
            check_api_level(CX_COMPAT_APILEVEL);
c0d00052:	f000 f867 	bl	c0d00124 <check_api_level>
c0d00056:	a80d      	add	r0, sp, #52	; 0x34
            // delegate to bitcoin app/lib
            libcall_params[0] = "Bitcoin";
            libcall_params[1] = 0x100; // use the Init call, as we won't exit
            libcall_params[2] = &coin_config;
c0d00058:	9021      	str	r0, [sp, #132]	; 0x84
c0d0005a:	2001      	movs	r0, #1
c0d0005c:	0200      	lsls	r0, r0, #8
        TRY {
            // ensure syscall will accept us
            check_api_level(CX_COMPAT_APILEVEL);
            // delegate to bitcoin app/lib
            libcall_params[0] = "Bitcoin";
            libcall_params[1] = 0x100; // use the Init call, as we won't exit
c0d0005e:	9020      	str	r0, [sp, #128]	; 0x80
    BEGIN_TRY {
        TRY {
            // ensure syscall will accept us
            check_api_level(CX_COMPAT_APILEVEL);
            // delegate to bitcoin app/lib
            libcall_params[0] = "Bitcoin";
c0d00060:	4810      	ldr	r0, [pc, #64]	; (c0d000a4 <main+0xa4>)
c0d00062:	4478      	add	r0, pc
c0d00064:	901f      	str	r0, [sp, #124]	; 0x7c
c0d00066:	a81f      	add	r0, sp, #124	; 0x7c
            libcall_params[1] = 0x100; // use the Init call, as we won't exit
            libcall_params[2] = &coin_config;
            os_lib_call(&libcall_params);
c0d00068:	f000 f868 	bl	c0d0013c <os_lib_call>
        }
        FINALLY {
c0d0006c:	f000 f87e 	bl	c0d0016c <try_context_get>
c0d00070:	a901      	add	r1, sp, #4
c0d00072:	4288      	cmp	r0, r1
c0d00074:	d102      	bne.n	c0d0007c <main+0x7c>
c0d00076:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d00078:	f000 f884 	bl	c0d00184 <try_context_set>
            app_exit();
c0d0007c:	f000 f814 	bl	c0d000a8 <app_exit>
c0d00080:	a801      	add	r0, sp, #4
        }
    }
    END_TRY;
c0d00082:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d00084:	2800      	cmp	r0, #0
c0d00086:	d102      	bne.n	c0d0008e <main+0x8e>
c0d00088:	2000      	movs	r0, #0
        }
        END_TRY;
    }
    app_exit();
#endif // USE_LIB_BITCOIN
    return 0;
c0d0008a:	b022      	add	sp, #136	; 0x88
c0d0008c:	bd70      	pop	{r4, r5, r6, pc}
        }
        FINALLY {
            app_exit();
        }
    }
    END_TRY;
c0d0008e:	f000 f841 	bl	c0d00114 <os_longjmp>
c0d00092:	46c0      	nop			; (mov r8, r8)
c0d00094:	736e744d 	.word	0x736e744d
c0d00098:	534e544d 	.word	0x534e544d
c0d0009c:	000003a2 	.word	0x000003a2
c0d000a0:	0000038a 	.word	0x0000038a
c0d000a4:	00000325 	.word	0x00000325

c0d000a8 <app_exit>:
    ux_step_count = 4;
    UX_DISPLAY(ui_request_change_path_approval_nanos, ui_request_change_path_approval_nanos_prepro);
#endif // #if TARGET_ID
}

void app_exit(void) {
c0d000a8:	b510      	push	{r4, lr}
c0d000aa:	b08c      	sub	sp, #48	; 0x30
c0d000ac:	466c      	mov	r4, sp
    BEGIN_TRY_L(exit) {
        TRY_L(exit) {
c0d000ae:	4620      	mov	r0, r4
c0d000b0:	f000 f874 	bl	c0d0019c <setjmp>
c0d000b4:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d000b6:	0400      	lsls	r0, r0, #16
c0d000b8:	d106      	bne.n	c0d000c8 <app_exit+0x20>
c0d000ba:	4668      	mov	r0, sp
c0d000bc:	f000 f862 	bl	c0d00184 <try_context_set>
c0d000c0:	900a      	str	r0, [sp, #40]	; 0x28
c0d000c2:	20ff      	movs	r0, #255	; 0xff
            os_sched_exit(-1);
c0d000c4:	f000 f846 	bl	c0d00154 <os_sched_exit>
        }
        FINALLY_L(exit) {
c0d000c8:	f000 f850 	bl	c0d0016c <try_context_get>
c0d000cc:	4669      	mov	r1, sp
c0d000ce:	4288      	cmp	r0, r1
c0d000d0:	d102      	bne.n	c0d000d8 <app_exit+0x30>
c0d000d2:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d000d4:	f000 f856 	bl	c0d00184 <try_context_set>
c0d000d8:	4668      	mov	r0, sp
        }
    }
    END_TRY_L(exit);
c0d000da:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d000dc:	2800      	cmp	r0, #0
c0d000de:	d101      	bne.n	c0d000e4 <app_exit+0x3c>
}
c0d000e0:	b00c      	add	sp, #48	; 0x30
c0d000e2:	bd10      	pop	{r4, pc}
            os_sched_exit(-1);
        }
        FINALLY_L(exit) {
        }
    }
    END_TRY_L(exit);
c0d000e4:	f000 f816 	bl	c0d00114 <os_longjmp>

c0d000e8 <os_memmove>:
  try_context_set(NULL);
#endif // HAVE_BOLOS
}


REENTRANT(void os_memmove(void * dst, const void WIDE * src, unsigned int length)) {
c0d000e8:	b5b0      	push	{r4, r5, r7, lr}
#define DSTCHAR ((unsigned char *)dst)
#define SRCCHAR ((unsigned char WIDE *)src)
  if (dst > src) {
c0d000ea:	4288      	cmp	r0, r1
c0d000ec:	d908      	bls.n	c0d00100 <os_memmove+0x18>
    while(length--) {
c0d000ee:	2a00      	cmp	r2, #0
c0d000f0:	d00f      	beq.n	c0d00112 <os_memmove+0x2a>
c0d000f2:	1e49      	subs	r1, r1, #1
c0d000f4:	1e40      	subs	r0, r0, #1
      DSTCHAR[length] = SRCCHAR[length];
c0d000f6:	5c8b      	ldrb	r3, [r1, r2]
c0d000f8:	5483      	strb	r3, [r0, r2]

REENTRANT(void os_memmove(void * dst, const void WIDE * src, unsigned int length)) {
#define DSTCHAR ((unsigned char *)dst)
#define SRCCHAR ((unsigned char WIDE *)src)
  if (dst > src) {
    while(length--) {
c0d000fa:	1e52      	subs	r2, r2, #1
c0d000fc:	d1fb      	bne.n	c0d000f6 <os_memmove+0xe>
c0d000fe:	e008      	b.n	c0d00112 <os_memmove+0x2a>
      DSTCHAR[length] = SRCCHAR[length];
    }
  }
  else {
    unsigned short l = 0;
    while (length--) {
c0d00100:	2a00      	cmp	r2, #0
c0d00102:	d006      	beq.n	c0d00112 <os_memmove+0x2a>
c0d00104:	2300      	movs	r3, #0
      DSTCHAR[l] = SRCCHAR[l];
c0d00106:	b29c      	uxth	r4, r3
c0d00108:	5d0d      	ldrb	r5, [r1, r4]
c0d0010a:	5505      	strb	r5, [r0, r4]
      l++;
c0d0010c:	1c5b      	adds	r3, r3, #1
      DSTCHAR[length] = SRCCHAR[length];
    }
  }
  else {
    unsigned short l = 0;
    while (length--) {
c0d0010e:	1e52      	subs	r2, r2, #1
c0d00110:	d1f9      	bne.n	c0d00106 <os_memmove+0x1e>
      DSTCHAR[l] = SRCCHAR[l];
      l++;
    }
  }
#undef DSTCHAR
}
c0d00112:	bdb0      	pop	{r4, r5, r7, pc}

c0d00114 <os_longjmp>:
  return (try_context_t*) current_ctx->jmp_buf[5];
}
#endif // BOLOS_EXCEPTION_OLD

#ifndef HAVE_BOLOS
void os_longjmp(unsigned int exception) {
c0d00114:	4604      	mov	r4, r0
#ifdef HAVE_PRINTF  
  unsigned int lr_val;
  __asm volatile("mov %0, lr" :"=r"(lr_val));
  PRINTF("exception[%d]: LR=0x%08X\n", exception, lr_val);
#endif // HAVE_PRINTF
  longjmp(try_context_get()->jmp_buf, exception);
c0d00116:	f000 f829 	bl	c0d0016c <try_context_get>
c0d0011a:	4621      	mov	r1, r4
c0d0011c:	f000 f84a 	bl	c0d001b4 <longjmp>

c0d00120 <SVC_Call>:

// avoid a separate asm file, but avoid any intrusion from the compiler
__attribute__((naked)) void SVC_Call(unsigned int syscall_id, volatile unsigned int * parameters);
__attribute__((naked)) void SVC_Call(__attribute__((unused)) unsigned int syscall_id, __attribute__((unused)) volatile unsigned int * parameters) {
  // delegate svc, ensure no optimization by gcc with naked and r0, r1 marked as clobbered
  asm volatile("svc #1":::"r0","r1");
c0d00120:	df01      	svc	1
  asm volatile("bx  lr");
c0d00122:	4770      	bx	lr

c0d00124 <check_api_level>:
}
void check_api_level ( unsigned int apiLevel ) 
{
c0d00124:	b580      	push	{r7, lr}
c0d00126:	b084      	sub	sp, #16
  volatile unsigned int parameters [2+1];
  parameters[0] = (unsigned int)apiLevel;
c0d00128:	9001      	str	r0, [sp, #4]
c0d0012a:	4803      	ldr	r0, [pc, #12]	; (c0d00138 <check_api_level+0x14>)
c0d0012c:	a901      	add	r1, sp, #4
  SVC_Call(SYSCALL_check_api_level_ID_IN, parameters);
c0d0012e:	f7ff fff7 	bl	c0d00120 <SVC_Call>
}
c0d00132:	b004      	add	sp, #16
c0d00134:	bd80      	pop	{r7, pc}
c0d00136:	46c0      	nop			; (mov r8, r8)
c0d00138:	60000137 	.word	0x60000137

c0d0013c <os_lib_call>:
  parameters[0] = (unsigned int)params;
  SVC_Call(SYSCALL_os_ux_read_parameters_ID_IN, parameters);
}

void os_lib_call ( unsigned int * call_parameters ) 
{
c0d0013c:	b580      	push	{r7, lr}
c0d0013e:	b084      	sub	sp, #16
  volatile unsigned int parameters [2+1];
  parameters[0] = (unsigned int)call_parameters;
c0d00140:	9001      	str	r0, [sp, #4]
c0d00142:	4803      	ldr	r0, [pc, #12]	; (c0d00150 <os_lib_call+0x14>)
c0d00144:	a901      	add	r1, sp, #4
  SVC_Call(SYSCALL_os_lib_call_ID_IN, parameters);
c0d00146:	f7ff ffeb 	bl	c0d00120 <SVC_Call>
}
c0d0014a:	b004      	add	sp, #16
c0d0014c:	bd80      	pop	{r7, pc}
c0d0014e:	46c0      	nop			; (mov r8, r8)
c0d00150:	6000670d 	.word	0x6000670d

c0d00154 <os_sched_exit>:
  parameters[0] = (unsigned int)application_index;
  SVC_Call(SYSCALL_os_sched_exec_ID_IN, parameters);
}

void os_sched_exit ( bolos_task_status_t exit_code ) 
{
c0d00154:	b580      	push	{r7, lr}
c0d00156:	b084      	sub	sp, #16
  volatile unsigned int parameters [2+1];
  parameters[0] = (unsigned int)exit_code;
c0d00158:	9001      	str	r0, [sp, #4]
c0d0015a:	4803      	ldr	r0, [pc, #12]	; (c0d00168 <os_sched_exit+0x14>)
c0d0015c:	a901      	add	r1, sp, #4
  SVC_Call(SYSCALL_os_sched_exit_ID_IN, parameters);
c0d0015e:	f7ff ffdf 	bl	c0d00120 <SVC_Call>
}
c0d00162:	b004      	add	sp, #16
c0d00164:	bd80      	pop	{r7, pc}
c0d00166:	46c0      	nop			; (mov r8, r8)
c0d00168:	60009abe 	.word	0x60009abe

c0d0016c <try_context_get>:
  parameters[0] = (unsigned int)page_adr;
  SVC_Call(SYSCALL_nvm_write_page_ID_IN, parameters);
}

try_context_t * try_context_get ( void ) 
{
c0d0016c:	b580      	push	{r7, lr}
c0d0016e:	b082      	sub	sp, #8
c0d00170:	4803      	ldr	r0, [pc, #12]	; (c0d00180 <try_context_get+0x14>)
c0d00172:	4669      	mov	r1, sp
  volatile unsigned int parameters [2];
#ifdef __clang_analyzer__
  parameters[1] = 0;
#endif
  SVC_Call(SYSCALL_try_context_get_ID_IN, parameters);
c0d00174:	f7ff ffd4 	bl	c0d00120 <SVC_Call>
  return (try_context_t *)(((volatile unsigned int*)parameters)[1]);
c0d00178:	9801      	ldr	r0, [sp, #4]
c0d0017a:	b002      	add	sp, #8
c0d0017c:	bd80      	pop	{r7, pc}
c0d0017e:	46c0      	nop			; (mov r8, r8)
c0d00180:	600087b1 	.word	0x600087b1

c0d00184 <try_context_set>:
}

try_context_t * try_context_set ( try_context_t * context ) 
{
c0d00184:	b580      	push	{r7, lr}
c0d00186:	b084      	sub	sp, #16
  volatile unsigned int parameters [2+1];
#ifdef __clang_analyzer__
  parameters[1] = 0;
#endif
  parameters[0] = (unsigned int)context;
c0d00188:	9001      	str	r0, [sp, #4]
c0d0018a:	4803      	ldr	r0, [pc, #12]	; (c0d00198 <try_context_set+0x14>)
c0d0018c:	a901      	add	r1, sp, #4
  SVC_Call(SYSCALL_try_context_set_ID_IN, parameters);
c0d0018e:	f7ff ffc7 	bl	c0d00120 <SVC_Call>
  return (try_context_t *)(((volatile unsigned int*)parameters)[1]);
c0d00192:	9802      	ldr	r0, [sp, #8]
c0d00194:	b004      	add	sp, #16
c0d00196:	bd80      	pop	{r7, pc}
c0d00198:	60008875 	.word	0x60008875

c0d0019c <setjmp>:
c0d0019c:	c0f0      	stmia	r0!, {r4, r5, r6, r7}
c0d0019e:	4641      	mov	r1, r8
c0d001a0:	464a      	mov	r2, r9
c0d001a2:	4653      	mov	r3, sl
c0d001a4:	465c      	mov	r4, fp
c0d001a6:	466d      	mov	r5, sp
c0d001a8:	4676      	mov	r6, lr
c0d001aa:	c07e      	stmia	r0!, {r1, r2, r3, r4, r5, r6}
c0d001ac:	3828      	subs	r0, #40	; 0x28
c0d001ae:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d001b0:	2000      	movs	r0, #0
c0d001b2:	4770      	bx	lr

c0d001b4 <longjmp>:
c0d001b4:	3010      	adds	r0, #16
c0d001b6:	c87c      	ldmia	r0!, {r2, r3, r4, r5, r6}
c0d001b8:	4690      	mov	r8, r2
c0d001ba:	4699      	mov	r9, r3
c0d001bc:	46a2      	mov	sl, r4
c0d001be:	46ab      	mov	fp, r5
c0d001c0:	46b5      	mov	sp, r6
c0d001c2:	c808      	ldmia	r0!, {r3}
c0d001c4:	3828      	subs	r0, #40	; 0x28
c0d001c6:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d001c8:	1c08      	adds	r0, r1, #0
c0d001ca:	d100      	bne.n	c0d001ce <longjmp+0x1a>
c0d001cc:	2001      	movs	r0, #1
c0d001ce:	4718      	bx	r3
c0d001d0:	756e614d 	.word	0x756e614d
c0d001d4:	61206c61 	.word	0x61206c61
c0d001d8:	6f727070 	.word	0x6f727070
c0d001dc:	006c6176 	.word	0x006c6176
c0d001e0:	6f747541 	.word	0x6f747541
c0d001e4:	70706120 	.word	0x70706120
c0d001e8:	61766f72 	.word	0x61766f72
c0d001ec:	7550006c 	.word	0x7550006c
c0d001f0:	63696c62 	.word	0x63696c62
c0d001f4:	79656b20 	.word	0x79656b20
c0d001f8:	78650073 	.word	0x78650073
c0d001fc:	74726f70 	.word	0x74726f70
c0d00200:	70706120 	.word	0x70706120
c0d00204:	61766f72 	.word	0x61766f72
c0d00208:	6142006c 	.word	0x6142006c
c0d0020c:	56006b63 	.word	0x56006b63
c0d00210:	69737265 	.word	0x69737265
c0d00214:	31006e6f 	.word	0x31006e6f
c0d00218:	312e332e 	.word	0x312e332e
c0d0021c:	73550037 	.word	0x73550037
c0d00220:	61772065 	.word	0x61772065
c0d00224:	74656c6c 	.word	0x74656c6c
c0d00228:	006f7420 	.word	0x006f7420
c0d0022c:	77656976 	.word	0x77656976
c0d00230:	63636120 	.word	0x63636120
c0d00234:	746e756f 	.word	0x746e756f
c0d00238:	65530073 	.word	0x65530073
c0d0023c:	6e697474 	.word	0x6e697474
c0d00240:	41007367 	.word	0x41007367
c0d00244:	74756f62 	.word	0x74756f62
c0d00248:	69755100 	.word	0x69755100
c0d0024c:	70612074 	.word	0x70612074
c0d00250:	61570070 	.word	0x61570070
c0d00254:	6e696e72 	.word	0x6e696e72
c0d00258:	00212067 	.word	0x00212067
c0d0025c:	20656854 	.word	0x20656854
c0d00260:	69726564 	.word	0x69726564
c0d00264:	69746176 	.word	0x69746176
c0d00268:	70006e6f 	.word	0x70006e6f
c0d0026c:	20687461 	.word	0x20687461
c0d00270:	75207369 	.word	0x75207369
c0d00274:	7573756e 	.word	0x7573756e
c0d00278:	44006c61 	.word	0x44006c61
c0d0027c:	76697265 	.word	0x76697265
c0d00280:	6f697461 	.word	0x6f697461
c0d00284:	6170206e 	.word	0x6170206e
c0d00288:	52006874 	.word	0x52006874
c0d0028c:	63656a65 	.word	0x63656a65
c0d00290:	66692074 	.word	0x66692074
c0d00294:	756f7920 	.word	0x756f7920
c0d00298:	00657227 	.word	0x00657227
c0d0029c:	20746f6e 	.word	0x20746f6e
c0d002a0:	65727573 	.word	0x65727573
c0d002a4:	6e6f4300 	.word	0x6e6f4300
c0d002a8:	6d726966 	.word	0x6d726966
c0d002ac:	64646100 	.word	0x64646100
c0d002b0:	73736572 	.word	0x73736572
c0d002b4:	64644100 	.word	0x64644100
c0d002b8:	73736572 	.word	0x73736572
c0d002bc:	6e6f4300 	.word	0x6e6f4300
c0d002c0:	6d726966 	.word	0x6d726966
c0d002c4:	6b6f7420 	.word	0x6b6f7420
c0d002c8:	45006e65 	.word	0x45006e65
c0d002cc:	726f7078 	.word	0x726f7078
c0d002d0:	75700074 	.word	0x75700074
c0d002d4:	63696c62 	.word	0x63696c62
c0d002d8:	79656b20 	.word	0x79656b20
c0d002dc:	6854003f 	.word	0x6854003f
c0d002e0:	68632065 	.word	0x68632065
c0d002e4:	65676e61 	.word	0x65676e61
c0d002e8:	74617020 	.word	0x74617020
c0d002ec:	68430068 	.word	0x68430068
c0d002f0:	65676e61 	.word	0x65676e61
c0d002f4:	74617020 	.word	0x74617020
c0d002f8:	72740068 	.word	0x72740068
c0d002fc:	61736e61 	.word	0x61736e61
c0d00300:	6f697463 	.word	0x6f697463
c0d00304:	6d41006e 	.word	0x6d41006e
c0d00308:	746e756f 	.word	0x746e756f
c0d0030c:	65654600 	.word	0x65654600
c0d00310:	69530073 	.word	0x69530073
c0d00314:	74206e67 	.word	0x74206e67
c0d00318:	6d006568 	.word	0x6d006568
c0d0031c:	61737365 	.word	0x61737365
c0d00320:	4d006567 	.word	0x4d006567
c0d00324:	61737365 	.word	0x61737365
c0d00328:	68206567 	.word	0x68206567
c0d0032c:	00687361 	.word	0x00687361
c0d00330:	4e4b4e55 	.word	0x4e4b4e55
c0d00334:	004e574f 	.word	0x004e574f
c0d00338:	41574552 	.word	0x41574552
c0d0033c:	6f004452 	.word	0x6f004452
c0d00340:	00696e6d 	.word	0x00696e6d
c0d00344:	494e4d4f 	.word	0x494e4d4f
c0d00348:	53550020 	.word	0x53550020
c0d0034c:	00205444 	.word	0x00205444
c0d00350:	4449414d 	.word	0x4449414d
c0d00354:	4d4f0020 	.word	0x4d4f0020
c0d00358:	6120494e 	.word	0x6120494e
c0d0035c:	74657373 	.word	0x74657373
c0d00360:	20642520 	.word	0x20642520
c0d00364:	53325000 	.word	0x53325000
c0d00368:	2e250048 	.word	0x2e250048
c0d0036c:	2e2e482a 	.word	0x2e2e482a
c0d00370:	2a2e252e 	.word	0x2a2e252e
c0d00374:	756f0048 	.word	0x756f0048
c0d00378:	74757074 	.word	0x74757074
c0d0037c:	64252320 	.word	0x64252320
c0d00380:	6e744d00 	.word	0x6e744d00
c0d00384:	544d0073 	.word	0x544d0073
c0d00388:	4200534e 	.word	0x4200534e
c0d0038c:	6f637469 	.word	0x6f637469
c0d00390:	00006e69 	.word	0x00006e69
c0d00394:	525f504f 	.word	0x525f504f
c0d00398:	52555445 	.word	0x52555445
c0d0039c:	0000004e 	.word	0x0000004e
c0d003a0:	435f504f 	.word	0x435f504f
c0d003a4:	54414552 	.word	0x54414552
c0d003a8:	00000045 	.word	0x00000045
c0d003ac:	746f6d4f 	.word	0x746f6d4f
c0d003b0:	73616e65 	.word	0x73616e65
c0d003b4:	6f436968 	.word	0x6f436968
c0d003b8:	00006e69 	.word	0x00006e69

c0d003bc <C_coin_config>:
c0d003bc:	0012003f 00000001 c0d003ac c0d00381     ?...............
c0d003cc:	c0d00386 00000000 00000000 00000000     ................
c0d003dc:	0000001b 00000000                       ........

c0d003e4 <_etext>:
	...
