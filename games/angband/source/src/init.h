/* File: init.h */

/*
 * Copyright (c) 2000 Robert Ruehlmann
 *
 * This software may be copied and distributed for educational, research,
 * and not for profit purposes provided that this copyright and statement
 * are included in all such copies.
 */

#ifndef INCLUDED_INIT_H
#define INCLUDED_INIT_H

#include "h-basic.h"
#include "z-bitflag.h"
#include "z-file.h"
#include "z-rand.h"
#include "parser.h"

/**
 * Information about maximal indices of certain arrays.
 *
 * These are actually not the maxima, but the maxima plus one, because of
 * 0-based indexing issues.
 */
typedef struct maxima
{
	u16b f_max;       /**< Maximum number of terrain features */
	u16b k_max;       /**< Maximum number of object base kinds */
	u16b a_max;       /**< Maximum number of artifact kinds */
	u16b e_max;       /**< Maximum number of ego-item kinds */
	u16b r_max;       /**< Maximum number of monster races */
	u16b mp_max;	  /**< Maximum number of monster pain message sets */
	u16b s_max;       /**< Maximum number of magic spells */
	u16b pit_max;	  /**< Maximum number of monster pit types */

	u16b o_max;       /**< Maximum number of objects on a given level */
	u16b m_max;       /**< Maximum number of monsters on a given level */
} maxima;

struct init_module {
	const char *name;
	void (*init)(void);
	void (*cleanup)(void);
};

extern maxima *z_info;

extern struct parser *init_parse_a(void);
extern struct parser *init_parse_c(void);
extern struct parser *init_parse_e(void);
extern struct parser *init_parse_f(void);
extern struct parser *init_parse_h(void);
extern struct parser *init_parse_k(void);
extern struct parser *init_parse_kb(void);
extern struct parser *init_parse_mp(void);
extern struct parser *init_parse_p(void);
extern struct parser *init_parse_pit(void);
extern struct parser *init_parse_r(void);
extern struct parser *init_parse_s(void);
extern struct parser *init_parse_v(void);
extern struct parser *init_parse_z(void);
extern struct parser *init_parse_flavor(void);
extern struct parser *init_parse_names(void);
extern struct parser *init_parse_hints(void);

extern void init_file_paths(const char *config, const char *lib, const char *data);
extern void init_arrays(void);
extern void create_needed_dirs(void);
extern bool init_angband(void);
extern void cleanup_angband(void);

#endif /* INCLUDED_INIT_H */