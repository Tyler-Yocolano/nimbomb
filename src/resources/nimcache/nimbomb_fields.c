/* Generated by Nim Compiler v0.17.1 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, gcc */
/* Command for C compiler:
   gcc.exe -c  -w -mno-ms-bitfields  -ID:\nim\lib -o d:\Documents\Programming\nim\nimbomb\src\resources\nimcache\nimbomb_fields.o d:\Documents\Programming\nim\nimbomb\src\resources\nimcache\nimbomb_fields.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
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
typedef struct tySequence_sM4lkSb7zS6F7OVMvW9cffQ tySequence_sM4lkSb7zS6F7OVMvW9cffQ;
typedef struct tyObject_Field_HPlg779bqHnNdJVA5YHupYg tyObject_Field_HPlg779bqHnNdJVA5YHupYg;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tySequence_9aitF7lf4eyrB9bzREUCMyVg tySequence_9aitF7lf4eyrB9bzREUCMyVg;
typedef struct tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g;
typedef struct tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w;
typedef struct tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ;
typedef struct tyObject_GcStack_7fytPA5bBsob6See21YMRA tyObject_GcStack_7fytPA5bBsob6See21YMRA;
typedef struct tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg;
typedef struct tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ;
typedef struct tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw;
typedef struct tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg;
typedef struct tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA;
typedef struct tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw;
typedef struct tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw;
typedef struct tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg;
typedef struct tyTuple_ujsjpB2O9cjj3uDHsXbnSzg tyTuple_ujsjpB2O9cjj3uDHsXbnSzg;
typedef struct tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg;
typedef struct tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ;
typedef struct tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg;
typedef struct tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ;
typedef struct RootObj RootObj;
typedef struct tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w;
typedef struct tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ;
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
tySequence_sM4lkSb7zS6F7OVMvW9cffQ* validRes;
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
typedef tyObject_Field_HPlg779bqHnNdJVA5YHupYg tyArray_9c5AmNkzc3Ncq9cBuHFHvtbQ[2];
typedef N_NIMCALL_PTR(void, tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ) (void);
typedef struct {
N_NIMCALL_PTR(NIM_BOOL, ClP_0) (tyObject_Field_HPlg779bqHnNdJVA5YHupYg item, void* ClE_0);
void* ClE_0;
} tyProc_A9bBs1SklyOtPtdQ9cykXT9ag;
typedef N_CLOSURE_PTR(NIM_BOOL, TM_9a3hZwANY6Vb7wp9cbyWG4vw_11) (tyObject_Field_HPlg779bqHnNdJVA5YHupYg item);
struct tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g {
NI refcount;
TNimType* typ;
};
struct tyObject_GcStack_7fytPA5bBsob6See21YMRA {
void* bottom;
};
struct tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w {
NI len;
NI cap;
tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g** d;
};
typedef tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* tyArray_SiRwrEKZdLgxqz9a9aoVBglg[512];
typedef tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw* tyArray_lh2A89ahMmYg9bCmpVaplLbA[256];
struct tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA {
tyArray_lh2A89ahMmYg9bCmpVaplLbA data;
};
typedef tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* tyArray_0aOLqZchNi8nWtMTi8ND8w[2];
struct tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw {
tyArray_0aOLqZchNi8nWtMTi8ND8w link;
NI key;
NI upperBound;
NI level;
};
struct tyTuple_ujsjpB2O9cjj3uDHsXbnSzg {
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* Field0;
NI Field1;
};
typedef tyTuple_ujsjpB2O9cjj3uDHsXbnSzg tyArray_LzOv2eCDGiceMKQstCLmhw[30];
struct tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg {
NI len;
tyArray_LzOv2eCDGiceMKQstCLmhw chunks;
tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg* next;
};
struct tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg {
NI minLargeObj;
NI maxLargeObj;
tyArray_SiRwrEKZdLgxqz9a9aoVBglg freeSmallChunks;
tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw* llmem;
NI currMem;
NI maxMem;
NI freeMem;
NI lastSize;
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* freeChunksList;
tyObject_IntSet_EZObFrE3NC9bIb3YMkY9crZA chunkStarts;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* root;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* deleted;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* last;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw* freeAvlNodes;
NIM_BOOL locked;
NIM_BOOL blockChunkSizeIncrease;
NI nextChunkSize;
tyObject_AvlNode_IaqjtwKhxLEpvDS9bct9blEw bottomData;
tyObject_HeapLinks_PDV1HBZ8CQSQJC9aOBFNRSg heapLinks;
};
struct tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg {
NI stackScans;
NI cycleCollections;
NI maxThreshold;
NI maxStackSize;
NI maxStackCells;
NI cycleTableSize;
NI64 maxPause;
};
struct tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ {
NI counter;
NI max;
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg* head;
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg** data;
};
struct tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ {
tyObject_GcStack_7fytPA5bBsob6See21YMRA stack;
NI cycleThreshold;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w zct;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w decStack;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w tempStack;
NI recGcLock;
tyObject_MemRegion_x81NhDv59b8ercDZ9bi85jyg region;
tyObject_GcStat_0RwLoVBHZPfUAcLczmfQAg stat;
tyObject_CellSet_jG87P0AI9aZtss9ccTYBIISQ marked;
tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w additionalRoots;
};
struct RootObj {
TNimType* m_type;
};
struct tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ {
  RootObj Sup;
NI colonstate_;
NimStringDesc* res1;
};
struct tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w {
NI prevSize;
NI size;
};
struct tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ {
  tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w Sup;
tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* next;
tyObject_SmallChunk_tXn60W2f8h3jgAYdEmy5NQ* prev;
tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ* freeList;
NI free;
NI acc;
NF data;
};
struct tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw {
NI size;
NI acc;
tyObject_LLChunk_XsENErzHIZV9bhvyJx56wGw* next;
};
struct tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg {
  tyObject_BaseChunk_Sdq7WpT6qAH858F5ZEdG3w Sup;
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* next;
tyObject_BigChunk_Rv9c70Uhp2TytkX7eH78qEg* prev;
NF data;
};
typedef NI tyArray_9a8QARi5WsUggNU9bom7kzTQ[8];
struct tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw {
tyObject_Trunk_W0r8S0Y3UGke6T9bIUWnnuw* next;
NI key;
tyArray_9a8QARi5WsUggNU9bom7kzTQ bits;
};
struct tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg {
tyObject_PageDesc_fublkgIY4LG3mT51LU2WHg* next;
NI key;
tyArray_9a8QARi5WsUggNU9bom7kzTQ bits;
};
struct tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ {
tyObject_FreeCell_u6M5LHprqzkn9axr04yg9bGQ* next;
NI zeroField;
};
struct tySequence_sM4lkSb7zS6F7OVMvW9cffQ {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
struct tySequence_9aitF7lf4eyrB9bzREUCMyVg {
  TGenericSeq Sup;
  tyObject_Field_HPlg779bqHnNdJVA5YHupYg data[SEQ_DECL_SIZE];
};
N_NIMCALL(void, newField_e9c5MIy9aDVT6I9ceI11xieig)(NimStringDesc* apiName, tySequence_sM4lkSb7zS6F7OVMvW9cffQ* validRes, tyObject_Field_HPlg779bqHnNdJVA5YHupYg* Result);
N_NIMCALL(void, unsureAsgnRef)(void** dest, void* src);
N_NIMCALL(NimStringDesc*, copyString)(NimStringDesc* src);
N_NIMCALL(void, genericSeqAssign)(void* dest, void* src, TNimType* mt);
static N_INLINE(void, nimFrame)(TFrame* s);
N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
N_NIMCALL(void, nimGCvisit)(void* d, NI op);
static N_NIMCALL(void, TM_9a3hZwANY6Vb7wp9cbyWG4vw_3)(void);
N_NIMCALL(void, nimRegisterGlobalMarker)(tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ markerProc);
N_NOINLINE(void, chckNil)(void* p);
N_NIMCALL(void, genericReset)(void* dest, TNimType* mt);
N_NIMCALL(tySequence_sM4lkSb7zS6F7OVMvW9cffQ*, newSeq_9cL6dIz2UWtIh3FeS5x4hxA)(NI len);
static N_INLINE(NIM_BOOL, contains_jPdUhZfr9a8sH2V3ZBDljzwfields)(NimStringDesc** a, NI aLen_0, NimStringDesc* item);
static N_INLINE(NI, find_9basNl9bVqn7SOf9bgUeI8TEQfields)(NimStringDesc** a, NI aLen_0, NimStringDesc* item);
N_NOINLINE(void, raiseIndexError)(void);
static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b);
static N_INLINE(NIM_BOOL, equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem)(void* a, void* b, NI size);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(tySequence_9aitF7lf4eyrB9bzREUCMyVg*, filter_joVEOMkVlrpVWzlXWjMmMQfields)(tySequence_9aitF7lf4eyrB9bzREUCMyVg* seq1, tyProc_A9bBs1SklyOtPtdQ9cykXT9ag pred);
N_NIMCALL(tySequence_9aitF7lf4eyrB9bzREUCMyVg*, newSeq_9c9clxBk6ynOKoFgJuYqUIAA)(NI len);
N_NIMCALL(TGenericSeq*, incrSeqV2)(TGenericSeq* seq, NI elemSize);
N_NIMCALL(NimStringDesc*, copyStringRC1)(NimStringDesc* src);
static N_INLINE(void, nimGCunrefNoCycle)(void* p);
static N_INLINE(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem)(void* usr);
static N_INLINE(void, rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_NOINLINE(void, addZCT_fCDI7oO1NNVXXURtxSzsRw)(tyObject_CellSeq_Axo1XVm9aaQueTOldv8le5w* s, tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c);
N_NIMCALL(tySequence_sM4lkSb7zS6F7OVMvW9cffQ*, getFieldList_v62FEUmv9ahSaNLbB9aJgURg)(NimStringDesc* res);
static N_NIMCALL(void, Marker_tyRef_EabEr7fHlQs9cuhsJeD2SMw)(void* p, NI op);
N_NIMCALL(void*, newObj)(TNimType* typ, NI size);
N_NIMCALL(void*, newSeq)(TNimType* typ, NI len);
N_CLOSURE(NIM_BOOL, colonanonymous__t39bNVaoHxRAUN38UfIF19cg)(tyObject_Field_HPlg779bqHnNdJVA5YHupYg x, void* ClE_0);
N_NIMCALL(void, failedAssertImpl_aDmpBTs9cPuXp0Mp9cfiNeyA)(NimStringDesc* msg);
extern TNimType NTI_sM4lkSb7zS6F7OVMvW9cffQ_;
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
tyArray_9c5AmNkzc3Ncq9cBuHFHvtbQ fieldList_h8L7CzL70Sz5fHjhWg9cbaw;
TNimType NTI_HPlg779bqHnNdJVA5YHupYg_;
extern TNimType NTI_77mFvmsOLKik79ci2hXkHEg_;
TNimType NTI_9c5AmNkzc3Ncq9cBuHFHvtbQ_;
extern tyObject_GcHeap_1TRH1TZMaVZTnLNcIHuNFQ gch_IcYaEuuWivYAS86vFMTS3Q;
extern TNimType NTI_13RNkKqUOX1TtorOUlKtqA_;
TNimType NTI_Kn6Ro347LQLvL3dMXir4nQ_;
extern TNimType NTI_xHTZrq9aYs6boc9bCba0JbpQ_;
TNimType NTI_EabEr7fHlQs9cuhsJeD2SMw_;
extern TNimType NTI_9aitF7lf4eyrB9bzREUCMyVg_;
STRING_LITERAL(TM_9a3hZwANY6Vb7wp9cbyWG4vw_4, "aliases", 7);
STRING_LITERAL(TM_9a3hZwANY6Vb7wp9cbyWG4vw_6, "game", 4);
NIM_CONST struct {
  TGenericSeq Sup;
  NimStringDesc* data[1];
} TM_9a3hZwANY6Vb7wp9cbyWG4vw_7 = {{1, 1}, {((NimStringDesc*) &TM_9a3hZwANY6Vb7wp9cbyWG4vw_6)}};
NIM_CONST tySequence_sM4lkSb7zS6F7OVMvW9cffQ* TM_9a3hZwANY6Vb7wp9cbyWG4vw_5 = ((tySequence_sM4lkSb7zS6F7OVMvW9cffQ*)&TM_9a3hZwANY6Vb7wp9cbyWG4vw_7);
STRING_LITERAL(TM_9a3hZwANY6Vb7wp9cbyWG4vw_8, "api_detail_url", 14);
STRING_LITERAL(TM_9a3hZwANY6Vb7wp9cbyWG4vw_15, "len(a) == L seq modified while iterating over it", 48);

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

N_NIMCALL(void, newField_e9c5MIy9aDVT6I9ceI11xieig)(NimStringDesc* apiName, tySequence_sM4lkSb7zS6F7OVMvW9cffQ* validRes, tyObject_Field_HPlg779bqHnNdJVA5YHupYg* Result) {
	nimfr_("newField", "fields.nim")
	nimln_(9, "fields.nim");
	unsureAsgnRef((void**) (&(*Result).apiName), copyString(apiName));
	nimln_(10, "fields.nim");
	genericSeqAssign((&(*Result).validRes), validRes, (&NTI_sM4lkSb7zS6F7OVMvW9cffQ_));
	popFrame();
}
static N_NIMCALL(void, TM_9a3hZwANY6Vb7wp9cbyWG4vw_3)(void) {
	NI T1_;
	T1_ = (NI)0;
	for (T1_ = 0; T1_ < 2; T1_++) {
	nimGCvisit((void*)fieldList_h8L7CzL70Sz5fHjhWg9cbaw[T1_].apiName, 0);
	nimGCvisit((void*)fieldList_h8L7CzL70Sz5fHjhWg9cbaw[T1_].validRes, 0);
	}
}

static N_INLINE(NIM_BOOL, equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem)(void* a, void* b, NI size) {
	NIM_BOOL result;
	int T1_;
	result = (NIM_BOOL)0;
	T1_ = (int)0;
	T1_ = memcmp(a, b, ((size_t) (size)));
	result = (T1_ == ((NI32) 0));
	return result;
}

static N_INLINE(NIM_BOOL, eqStrings)(NimStringDesc* a, NimStringDesc* b) {
	NIM_BOOL result;
	NIM_BOOL T11_;
{	result = (NIM_BOOL)0;
	{
		if (!(a == b)) goto LA3_;
		result = NIM_TRUE;
		goto BeforeRet_;
	}
	LA3_: ;
	{
		NIM_BOOL T7_;
		T7_ = (NIM_BOOL)0;
		T7_ = (a == NIM_NIL);
		if (T7_) goto LA8_;
		T7_ = (b == NIM_NIL);
		LA8_: ;
		if (!T7_) goto LA9_;
		result = NIM_FALSE;
		goto BeforeRet_;
	}
	LA9_: ;
	T11_ = (NIM_BOOL)0;
	T11_ = ((*a).Sup.len == (*b).Sup.len);
	if (!(T11_)) goto LA12_;
	T11_ = equalMem_fmeFeLBvgmAHG9bC8ETS9bYQsystem(((void*) ((*a).data)), ((void*) ((*b).data)), ((NI) ((*a).Sup.len)));
	LA12_: ;
	result = T11_;
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, addInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	result = (NI)((NU64)(a) + (NU64)(b));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 0) <= (NI)(result ^ a));
		if (T3_) goto LA4_;
		T3_ = (((NI) 0) <= (NI)(result ^ b));
		LA4_: ;
		if (!T3_) goto LA5_;
		goto BeforeRet_;
	}
	LA5_: ;
	raiseOverflow();
	}BeforeRet_: ;
	return result;
}

static N_INLINE(NI, find_9basNl9bVqn7SOf9bgUeI8TEQfields)(NimStringDesc** a, NI aLen_0, NimStringDesc* item) {
	NI result;
	nimfr_("find", "system.nim")
{	result = (NI)0;
	{
		NimStringDesc* i;
		NI i_2;
		i = (NimStringDesc*)0;
		nimln_(2066, "system.nim");
		i_2 = ((NI) 0);
		{
			nimln_(2067, "system.nim");
			while (1) {
				NI TM_9a3hZwANY6Vb7wp9cbyWG4vw_9;
				NI TM_9a3hZwANY6Vb7wp9cbyWG4vw_10;
				if (!(i_2 < aLen_0)) goto LA3;
				nimln_(2068, "system.nim");
				if ((NU)(i_2) >= (NU)(aLen_0)) raiseIndexError();
				i = a[i_2];
				nimln_(2300, "system.nim");
				{
					if (!eqStrings(i, item)) goto LA6_;
					goto BeforeRet_;
				}
				LA6_: ;
				nimln_(2301, "system.nim");
				TM_9a3hZwANY6Vb7wp9cbyWG4vw_9 = addInt(result, ((NI) 1));
				result = (NI)(TM_9a3hZwANY6Vb7wp9cbyWG4vw_9);
				nimln_(2069, "system.nim");
				TM_9a3hZwANY6Vb7wp9cbyWG4vw_10 = addInt(i_2, ((NI) 1));
				i_2 = (NI)(TM_9a3hZwANY6Vb7wp9cbyWG4vw_10);
			} LA3: ;
		}
	}
	nimln_(2302, "system.nim");
	result = ((NI) -1);
	}BeforeRet_: ;
	popFrame();
	return result;
}

static N_INLINE(NIM_BOOL, contains_jPdUhZfr9a8sH2V3ZBDljzwfields)(NimStringDesc** a, NI aLen_0, NimStringDesc* item) {
	NIM_BOOL result;
	NI T1_;
	nimfr_("contains", "system.nim")
{	result = (NIM_BOOL)0;
	nimln_(2307, "system.nim");
	T1_ = (NI)0;
	T1_ = find_9basNl9bVqn7SOf9bgUeI8TEQfields(a, aLen_0, item);
	result = (((NI) 0) <= T1_);
	goto BeforeRet_;
	}BeforeRet_: ;
	popFrame();
	return result;
}

static N_INLINE(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*, usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem)(void* usr) {
	tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* result;
	nimfr_("usrToCell", "gc.nim")
	result = (tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*)0;
	nimln_(138, "gc.nim");
	result = ((tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g*) ((NI)((NU64)(((NI) (usr))) - (NU64)(((NI)sizeof(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g))))));
	popFrame();
	return result;
}

static N_INLINE(void, rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system)(tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c) {
	nimfr_("rtlAddZCT", "gc.nim")
	nimln_(216, "gc.nim");
	addZCT_fCDI7oO1NNVXXURtxSzsRw((&gch_IcYaEuuWivYAS86vFMTS3Q.zct), c);
	popFrame();
}

static N_INLINE(void, nimGCunrefNoCycle)(void* p) {
	tyObject_Cell_1zcF9cV8XIAtbN8h5HRUB8g* c;
	nimfr_("nimGCunrefNoCycle", "gc.nim")
	nimln_(255, "gc.nim");
	c = usrToCell_yB9aH5WIlwd0xkYrcdPeXrQsystem(p);
	nimln_(257, "gc.nim");
	{
		(*c).refcount -= ((NI) 8);
		if (!((NU64)((*c).refcount) < (NU64)(((NI) 8)))) goto LA3_;
		nimln_(258, "gc.nim");
		rtlAddZCT_MV4BBk6J1qu70IbBxwEn4w_2system(c);
	}
	LA3_: ;
	popFrame();
}

static N_INLINE(tySequence_9aitF7lf4eyrB9bzREUCMyVg*, filter_joVEOMkVlrpVWzlXWjMmMQfields)(tySequence_9aitF7lf4eyrB9bzREUCMyVg* seq1, tyProc_A9bBs1SklyOtPtdQ9cykXT9ag pred) {
	tySequence_9aitF7lf4eyrB9bzREUCMyVg* result;
	nimfr_("filter", "sequtils.nim")
	result = (tySequence_9aitF7lf4eyrB9bzREUCMyVg*)0;
	nimln_(684, "system.nim");
	result = newSeq_9c9clxBk6ynOKoFgJuYqUIAA(((NI) 0));
	{
		NI i;
		NI colontmp_;
		NI i_2;
		i = (NI)0;
		colontmp_ = (NI)0;
		nimln_(283, "sequtils.nim");
		colontmp_ = (seq1 ? seq1->Sup.len : 0);
		nimln_(3819, "system.nim");
		i_2 = ((NI) 0);
		{
			nimln_(3820, "system.nim");
			while (1) {
				NI TM_9a3hZwANY6Vb7wp9cbyWG4vw_12;
				if (!(i_2 < colontmp_)) goto LA3;
				nimln_(3821, "system.nim");
				i = i_2;
				nimln_(284, "sequtils.nim");
				{
					NIM_BOOL T6_;
					NimStringDesc* T9_;
					if ((NU)(i) >= (NU)(seq1->Sup.len)) raiseIndexError();
					T6_ = (NIM_BOOL)0;
					T6_ = pred.ClE_0? pred.ClP_0(seq1->data[i], pred.ClE_0):((TM_9a3hZwANY6Vb7wp9cbyWG4vw_11)(pred.ClP_0))(seq1->data[i]);
					if (!T6_) goto LA7_;
					nimln_(285, "sequtils.nim");
					if ((NU)(i) >= (NU)(seq1->Sup.len)) raiseIndexError();
					result = (tySequence_9aitF7lf4eyrB9bzREUCMyVg*) incrSeqV2(&(result)->Sup, sizeof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg));
					T9_ = (NimStringDesc*)0;
					T9_ = result->data[result->Sup.len].apiName; result->data[result->Sup.len].apiName = copyStringRC1(seq1->data[i].apiName);
					if (T9_) nimGCunrefNoCycle(T9_);
					genericSeqAssign((&result->data[result->Sup.len].validRes), seq1->data[i].validRes, (&NTI_sM4lkSb7zS6F7OVMvW9cffQ_));
					++result->Sup.len;
				}
				LA7_: ;
				nimln_(3822, "system.nim");
				TM_9a3hZwANY6Vb7wp9cbyWG4vw_12 = addInt(i_2, ((NI) 1));
				i_2 = (NI)(TM_9a3hZwANY6Vb7wp9cbyWG4vw_12);
			} LA3: ;
		}
	}
	popFrame();
	return result;
}
static N_NIMCALL(void, Marker_tyRef_EabEr7fHlQs9cuhsJeD2SMw)(void* p, NI op) {
	tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ* a;
	a = (tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ*)p;
	nimGCvisit((void*)(*a).res1, op);
}

N_CLOSURE(NIM_BOOL, colonanonymous__t39bNVaoHxRAUN38UfIF19cg)(tyObject_Field_HPlg779bqHnNdJVA5YHupYg x, void* ClE_0) {
	NIM_BOOL result;
	tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ* colonenvP_;
	nimfr_(":anonymous", "fields.nim")
	result = (NIM_BOOL)0;
	colonenvP_ = (tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ*) ClE_0;
	nimln_(21, "fields.nim");
	result = contains_jPdUhZfr9a8sH2V3ZBDljzwfields(x.validRes->data, x.validRes->Sup.len, (*colonenvP_).res1);
	popFrame();
	return result;
}

N_NIMCALL(tySequence_sM4lkSb7zS6F7OVMvW9cffQ*, getFieldList_v62FEUmv9ahSaNLbB9aJgURg)(NimStringDesc* res) {
	tySequence_sM4lkSb7zS6F7OVMvW9cffQ* result;
	tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ* colonenv_;
	NimStringDesc* T1_;
	tySequence_9aitF7lf4eyrB9bzREUCMyVg* filtered;
	tySequence_9aitF7lf4eyrB9bzREUCMyVg* T2_;
	NimStringDesc* T3_;
	NimStringDesc* T4_;
	tyProc_A9bBs1SklyOtPtdQ9cykXT9ag T5_;
	nimfr_("getFieldList", "fields.nim")
	result = (tySequence_sM4lkSb7zS6F7OVMvW9cffQ*)0;
	colonenv_ = (tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ*)0;
	nimln_(19, "fields.nim");
	colonenv_ = (tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ*) newObj((&NTI_EabEr7fHlQs9cuhsJeD2SMw_), sizeof(tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ));
	(*colonenv_).Sup.m_type = (&NTI_Kn6Ro347LQLvL3dMXir4nQ_);
	T1_ = (NimStringDesc*)0;
	T1_ = (*colonenv_).res1; (*colonenv_).res1 = copyStringRC1(res);
	if (T1_) nimGCunrefNoCycle(T1_);
	nimln_(684, "system.nim");
	result = newSeq_9cL6dIz2UWtIh3FeS5x4hxA(((NI) 0));
	nimln_(21, "fields.nim");
	T2_ = (tySequence_9aitF7lf4eyrB9bzREUCMyVg*)0;
	T2_ = (tySequence_9aitF7lf4eyrB9bzREUCMyVg*) newSeq((&NTI_9aitF7lf4eyrB9bzREUCMyVg_), 2);
	T3_ = (NimStringDesc*)0;
	T3_ = T2_->data[0].apiName; T2_->data[0].apiName = copyStringRC1(fieldList_h8L7CzL70Sz5fHjhWg9cbaw[0].apiName);
	if (T3_) nimGCunrefNoCycle(T3_);
	genericSeqAssign((&T2_->data[0].validRes), fieldList_h8L7CzL70Sz5fHjhWg9cbaw[0].validRes, (&NTI_sM4lkSb7zS6F7OVMvW9cffQ_));
	T4_ = (NimStringDesc*)0;
	T4_ = T2_->data[1].apiName; T2_->data[1].apiName = copyStringRC1(fieldList_h8L7CzL70Sz5fHjhWg9cbaw[1].apiName);
	if (T4_) nimGCunrefNoCycle(T4_);
	genericSeqAssign((&T2_->data[1].validRes), fieldList_h8L7CzL70Sz5fHjhWg9cbaw[1].validRes, (&NTI_sM4lkSb7zS6F7OVMvW9cffQ_));
	memset((void*)(&T5_), 0, sizeof(T5_));
	T5_.ClP_0 = colonanonymous__t39bNVaoHxRAUN38UfIF19cg; T5_.ClE_0 = colonenv_;
	filtered = filter_joVEOMkVlrpVWzlXWjMmMQfields(T2_, T5_);
	{
		tyObject_Field_HPlg779bqHnNdJVA5YHupYg field;
		NI i;
		NI L;
		memset((void*)(&field), 0, sizeof(field));
		nimln_(3626, "system.nim");
		i = ((NI) 0);
		nimln_(3627, "system.nim");
		L = (filtered ? filtered->Sup.len : 0);
		{
			nimln_(3628, "system.nim");
			while (1) {
				NimStringDesc* T9_;
				NI TM_9a3hZwANY6Vb7wp9cbyWG4vw_14;
				if (!(i < L)) goto LA8;
				nimln_(3629, "system.nim");
				if ((NU)(i) >= (NU)(filtered->Sup.len)) raiseIndexError();
				field.apiName = filtered->data[i].apiName;
				field.validRes = filtered->data[i].validRes;
				nimln_(23, "fields.nim");
				result = (tySequence_sM4lkSb7zS6F7OVMvW9cffQ*) incrSeqV2(&(result)->Sup, sizeof(NimStringDesc*));
				T9_ = (NimStringDesc*)0;
				T9_ = result->data[result->Sup.len]; result->data[result->Sup.len] = copyStringRC1(field.apiName);
				if (T9_) nimGCunrefNoCycle(T9_);
				++result->Sup.len;
				nimln_(3630, "system.nim");
				TM_9a3hZwANY6Vb7wp9cbyWG4vw_14 = addInt(i, ((NI) 1));
				i = (NI)(TM_9a3hZwANY6Vb7wp9cbyWG4vw_14);
				nimln_(3631, "system.nim");
				{
					if (!!(((filtered ? filtered->Sup.len : 0) == L))) goto LA12_;
					failedAssertImpl_aDmpBTs9cPuXp0Mp9cfiNeyA(((NimStringDesc*) &TM_9a3hZwANY6Vb7wp9cbyWG4vw_15));
				}
				LA12_: ;
			} LA8: ;
		}
	}
	popFrame();
	return result;
}
NIM_EXTERNC N_NOINLINE(void, nimbomb_fieldsInit000)(void) {
	nimfr_("fields", "fields.nim")
nimRegisterGlobalMarker(TM_9a3hZwANY6Vb7wp9cbyWG4vw_3);
	nimln_(12, "fields.nim");
	nimln_(13, "fields.nim");
	chckNil((void*)(&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[0]));
	genericReset((void*)(&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[0]), (&NTI_HPlg779bqHnNdJVA5YHupYg_));
	newField_e9c5MIy9aDVT6I9ceI11xieig(((NimStringDesc*) &TM_9a3hZwANY6Vb7wp9cbyWG4vw_4), TM_9a3hZwANY6Vb7wp9cbyWG4vw_5, (&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[0]));
	nimln_(15, "fields.nim");
	chckNil((void*)(&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[1]));
	genericReset((void*)(&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[1]), (&NTI_HPlg779bqHnNdJVA5YHupYg_));
	newField_e9c5MIy9aDVT6I9ceI11xieig(((NimStringDesc*) &TM_9a3hZwANY6Vb7wp9cbyWG4vw_8), TM_9a3hZwANY6Vb7wp9cbyWG4vw_5, (&fieldList_h8L7CzL70Sz5fHjhWg9cbaw[1]));
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, nimbomb_fieldsDatInit000)(void) {
static TNimNode* TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[2];
static TNimNode* TM_9a3hZwANY6Vb7wp9cbyWG4vw_13[2];
static TNimNode TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[6];
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
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].offset = offsetof(tyObject_Field_HPlg779bqHnNdJVA5YHupYg, validRes);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].typ = (&NTI_sM4lkSb7zS6F7OVMvW9cffQ_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[2].name = "validRes";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].len = 2; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].kind = 2; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0].sons = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_2[0];
NTI_HPlg779bqHnNdJVA5YHupYg_.node = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[0];
NTI_9c5AmNkzc3Ncq9cBuHFHvtbQ_.size = sizeof(tyArray_9c5AmNkzc3Ncq9cBuHFHvtbQ);
NTI_9c5AmNkzc3Ncq9cBuHFHvtbQ_.kind = 16;
NTI_9c5AmNkzc3Ncq9cBuHFHvtbQ_.base = (&NTI_HPlg779bqHnNdJVA5YHupYg_);
NTI_9c5AmNkzc3Ncq9cBuHFHvtbQ_.flags = 2;
NTI_Kn6Ro347LQLvL3dMXir4nQ_.size = sizeof(tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ);
NTI_Kn6Ro347LQLvL3dMXir4nQ_.kind = 17;
NTI_Kn6Ro347LQLvL3dMXir4nQ_.base = (&NTI_13RNkKqUOX1TtorOUlKtqA_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_13[0] = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4];
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4].kind = 1;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4].offset = offsetof(tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ, colonstate_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4].typ = (&NTI_xHTZrq9aYs6boc9bCba0JbpQ_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[4].name = ":state";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_13[1] = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[5];
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[5].kind = 1;
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[5].offset = offsetof(tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ, res1);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[5].typ = (&NTI_77mFvmsOLKik79ci2hXkHEg_);
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[5].name = "res1";
TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].len = 2; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].kind = 2; TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3].sons = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_13[0];
NTI_Kn6Ro347LQLvL3dMXir4nQ_.node = &TM_9a3hZwANY6Vb7wp9cbyWG4vw_0[3];
NTI_EabEr7fHlQs9cuhsJeD2SMw_.size = sizeof(tyObject_Env_fieldsdotnim__Kn6Ro347LQLvL3dMXir4nQ*);
NTI_EabEr7fHlQs9cuhsJeD2SMw_.kind = 22;
NTI_EabEr7fHlQs9cuhsJeD2SMw_.base = (&NTI_Kn6Ro347LQLvL3dMXir4nQ_);
NTI_EabEr7fHlQs9cuhsJeD2SMw_.marker = Marker_tyRef_EabEr7fHlQs9cuhsJeD2SMw;
}

