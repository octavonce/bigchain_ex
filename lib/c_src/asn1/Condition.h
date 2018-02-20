/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "CryptoConditions"
 * 	found in "CryptoConditions.asn"
 * 	`asn1c -fcompound-names`
 */

#ifndef	_Condition_H_
#define	_Condition_H_


#include <asn_application.h>

/* Including external dependencies */
#include "SimpleSha256Condition.h"
#include "CompoundSha256Condition.h"
#include <constr_CHOICE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum Condition_PR {
	Condition_PR_NOTHING,	/* No components present */
	Condition_PR_preimageSha256,
	Condition_PR_prefixSha256,
	Condition_PR_thresholdSha256,
	Condition_PR_rsaSha256,
	Condition_PR_ed25519Sha256
} Condition_PR;

/* Condition */
typedef struct Condition {
	Condition_PR present;
	union Condition_u {
		SimpleSha256Condition_t	 preimageSha256;
		CompoundSha256Condition_t	 prefixSha256;
		CompoundSha256Condition_t	 thresholdSha256;
		SimpleSha256Condition_t	 rsaSha256;
		SimpleSha256Condition_t	 ed25519Sha256;
	} choice;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} Condition_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_Condition;
extern asn_CHOICE_specifics_t asn_SPC_Condition_specs_1;
extern asn_TYPE_member_t asn_MBR_Condition_1[5];
extern asn_per_constraints_t asn_PER_type_Condition_constr_1;

#ifdef __cplusplus
}
#endif

#endif	/* _Condition_H_ */
#include <asn_internal.h>