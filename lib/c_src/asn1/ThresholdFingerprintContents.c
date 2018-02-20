/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "Fingerprints"
 * 	found in "Fingerprints.asn"
 * 	`asn1c -fcompound-names`
 */

#include "ThresholdFingerprintContents.h"

static int
memb_threshold_constraint_1(const asn_TYPE_descriptor_t *td, const void *sptr,
			asn_app_constraint_failed_f *ctfailcb, void *app_key) {
	long value;
	
	if(!sptr) {
		ASN__CTFAIL(app_key, td, sptr,
			"%s: value not given (%s:%d)",
			td->name, __FILE__, __LINE__);
		return -1;
	}
	
	value = *(const long *)sptr;
	
	if((value >= 1 && value <= 65535)) {
		/* Constraint check succeeded */
		return 0;
	} else {
		ASN__CTFAIL(app_key, td, sptr,
			"%s: constraint failed (%s:%d)",
			td->name, __FILE__, __LINE__);
		return -1;
	}
}

static asn_oer_constraints_t asn_OER_memb_threshold_constr_2 CC_NOTUSED = {
	{ 2, 1 }	/* (1..65535) */,
	-1};
static asn_per_constraints_t asn_PER_memb_threshold_constr_2 CC_NOTUSED = {
	{ APC_CONSTRAINED,	 16,  16,  1,  65535 }	/* (1..65535) */,
	{ APC_UNCONSTRAINED,	-1, -1,  0,  0 },
	0, 0	/* No PER value map */
};
static asn_TYPE_member_t asn_MBR_subconditions_3[] = {
	{ ATF_POINTER, 0, 0,
		-1 /* Ambiguous tag (CHOICE?) */,
		0,
		&asn_DEF_Condition,
		0,
		{ 0, 0, 0 },
		0, 0, /* No default value */
		""
		},
};
static const ber_tlv_tag_t asn_DEF_subconditions_tags_3[] = {
	(ASN_TAG_CLASS_CONTEXT | (1 << 2)),
	(ASN_TAG_CLASS_UNIVERSAL | (17 << 2))
};
static asn_SET_OF_specifics_t asn_SPC_subconditions_specs_3 = {
	sizeof(struct ThresholdFingerprintContents__subconditions),
	offsetof(struct ThresholdFingerprintContents__subconditions, _asn_ctx),
	2,	/* XER encoding is XMLValueList */
};
static /* Use -fall-defs-global to expose */
asn_TYPE_descriptor_t asn_DEF_subconditions_3 = {
	"subconditions",
	"subconditions",
	&asn_OP_SET_OF,
	asn_DEF_subconditions_tags_3,
	sizeof(asn_DEF_subconditions_tags_3)
		/sizeof(asn_DEF_subconditions_tags_3[0]) - 1, /* 1 */
	asn_DEF_subconditions_tags_3,	/* Same as above */
	sizeof(asn_DEF_subconditions_tags_3)
		/sizeof(asn_DEF_subconditions_tags_3[0]), /* 2 */
	{ 0, 0, SET_OF_constraint },
	asn_MBR_subconditions_3,
	1,	/* Single element */
	&asn_SPC_subconditions_specs_3	/* Additional specs */
};

static asn_TYPE_member_t asn_MBR_ThresholdFingerprintContents_1[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct ThresholdFingerprintContents, threshold),
		(ASN_TAG_CLASS_CONTEXT | (0 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_NativeInteger,
		0,
		{ &asn_OER_memb_threshold_constr_2, &asn_PER_memb_threshold_constr_2,  memb_threshold_constraint_1 },
		0, 0, /* No default value */
		"threshold"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct ThresholdFingerprintContents, subconditions),
		(ASN_TAG_CLASS_CONTEXT | (1 << 2)),
		0,
		&asn_DEF_subconditions_3,
		0,
		{ 0, 0, 0 },
		0, 0, /* No default value */
		"subconditions"
		},
};
static const ber_tlv_tag_t asn_DEF_ThresholdFingerprintContents_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static const asn_TYPE_tag2member_t asn_MAP_ThresholdFingerprintContents_tag2el_1[] = {
    { (ASN_TAG_CLASS_CONTEXT | (0 << 2)), 0, 0, 0 }, /* threshold */
    { (ASN_TAG_CLASS_CONTEXT | (1 << 2)), 1, 0, 0 } /* subconditions */
};
static asn_SEQUENCE_specifics_t asn_SPC_ThresholdFingerprintContents_specs_1 = {
	sizeof(struct ThresholdFingerprintContents),
	offsetof(struct ThresholdFingerprintContents, _asn_ctx),
	asn_MAP_ThresholdFingerprintContents_tag2el_1,
	2,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* First extension addition */
};
asn_TYPE_descriptor_t asn_DEF_ThresholdFingerprintContents = {
	"ThresholdFingerprintContents",
	"ThresholdFingerprintContents",
	&asn_OP_SEQUENCE,
	asn_DEF_ThresholdFingerprintContents_tags_1,
	sizeof(asn_DEF_ThresholdFingerprintContents_tags_1)
		/sizeof(asn_DEF_ThresholdFingerprintContents_tags_1[0]), /* 1 */
	asn_DEF_ThresholdFingerprintContents_tags_1,	/* Same as above */
	sizeof(asn_DEF_ThresholdFingerprintContents_tags_1)
		/sizeof(asn_DEF_ThresholdFingerprintContents_tags_1[0]), /* 1 */
	{ 0, 0, SEQUENCE_constraint },
	asn_MBR_ThresholdFingerprintContents_1,
	2,	/* Elements count */
	&asn_SPC_ThresholdFingerprintContents_specs_1	/* Additional specs */
};
