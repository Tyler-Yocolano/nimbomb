/* Generated by Nim Compiler v0.17.1 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, gcc */
/* Command for C compiler:
   gcc.exe -c  -w -mno-ms-bitfields  -ID:\nim\lib -o d:\Documents\Programming\nim\nimbomb\src\resources\nimcache\nimbomb_fields.o d:\Documents\Programming\nim\nimbomb\src\resources\nimcache\nimbomb_fields.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef powerpc
#undef unix
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_Field_HPlg779bqHnNdJVA5YHupYg tyObject_Field_HPlg779bqHnNdJVA5YHupYg;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
struct tyObject_Field_HPlg779bqHnNdJVA5YHupYg {
NimStringDesc* apiName;
NIM_BOOL sortable;
NIM_BOOL filterable;
};
typedef NU8 tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A;
typedef NU8 tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ;
typedef N_NIMCALL_PTR(void, tyProc_ojoeKfW4VYIm36I9cpDTQIg) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p);
struct TNimType {
NI size;
tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A kind;
tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ flags;
TNimType* base;
TNimNode* node;
void* finalizer;
tyProc_ojoeKfW4VYIm36I9cpDTQIg marker;
tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ;
struct TNimNode {
tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
N_NIMCALL(void, newField_7ytvznlCJ2CAcLuIHJSa9bA)(NimStringDesc* apiName, NIM_BOOL sortable, NIM_BOOL filterable, tyObject_Field_HPlg779bqHnNdJVA5YHupYg* Result);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
static N_INLINE(void, nimFrame)(TFrame* s);
N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
TNimType NTI_HPlg779bqHnNdJVA5YHupYg_;
extern TNimType NTI_77mFvmsOLKik79ci2hXkHEg_;
extern TNimType NTI_VaVACK0bpYmqIQ0mKcHfQQ_;

static N_INLINE(void, nimFrame)(TFrame* s) {
	NI T1_;
	T1_ = (NI)0;
	{
		if (!(framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw == NIM_NIL)) goto LA4_;
		T1_ = ((NI) 0);
	}
	goto LA2_;
	LA4_: ;
	{
		T1_ = ((NI) ((NI16)((*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1))));
	}
	LA2_: ;
	(*s).calldepth = ((NI16) (T1_));
	(*s).prev = framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA9_;
		stackOverflow_II46IjNZztN9bmbxUD8dt8g();
	}
	LA9_: ;
}

static N_INLINE(void, popFrame)(void) {
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}

N_NIMCALL(void, newField_7ytvznlCJ2CAcLuIHJSa9bA)(NimStringDesc* apiName, NIM_BOOL sortable, NIM_BOOL filterable, tyObject_Field_HPlg779bqHnNdJVA5YHupYg* Result) {
	nimfr_("newField", "fields.nim")
	nimln_(13, "fields.nim");
	unsureAsgnRef((void**) (&(*Result).apiName), copyString(apiName));
	nimln_(14, "fields.nim");
	(*Result).sortable = sortable;
	nimln_(15, "fields.nim");
	(*Result).filterable = filterable;
	popFrame();
}
NIM_EXTERNC N_NOINLINE(void, nimbomb_fieldsInit000)(void) {
	nimfr_("fields", "fields.nim")
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, nimbomb_fieldsDatInit000)(void) {
static TNimNode* TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[3];
static TNimNode TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4];
NTI_HPlg779bqHnNdJVA5YHupYg_.size = sizeof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg);
NTI_HPlg779bqHnNdJVA5YHupYg_.kind = 18;
NTI_HPlg779bqHnNdJVA5YHupYg_.base = 0;
NTI_HPlg779bqHnNdJVA5YHupYg_.flags = 2;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[0] = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[1];
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[1].kind = 1;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[1].offset = offsetof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg, apiName);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[1].typ = (&NTI_77mFvmsOLKik79ci2hXkHEg_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[1].name = "apiName";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[1] = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2];
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].kind = 1;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].offset = offsetof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg, sortable);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].typ = (&NTI_VaVACK0bpYmqIQ0mKcHfQQ_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].name = "sortable";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[2] = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3];
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].kind = 1;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].offset = offsetof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg, filterable);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].typ = (&NTI_VaVACK0bpYmqIQ0mKcHfQQ_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].name = "filterable";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].len = 3; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].kind = 2; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].sons = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[0];
NTI_HPlg779bqHnNdJVA5YHupYg_.node = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0];
}

