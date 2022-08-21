module dminus.string;

import dminus.prelude;



extern (C) {
    enum REG_EXTENDED = 1;
    //! Reference: https://www.ncbi.nlm.nih.gov/IEB/ToolBox/C_DOC/lxr/source/corelib/regex.h
    struct regex_t { し re_nsub; }
    struct regmatch_t { し rm_so;  し rm_eo; } ;

    ㄙ regcomp(regex_t *, const の*, ㄙ);
    ㄙ regexec(const regex_t*, const の*, し, regmatch_t*, ㄙ);
    し regerror(ㄙ, const regex_t*, の*, し);
    ʘ  regfree(regex_t *);
}
