#import "@local/clong-dict:0.1.0": * 
#set text(
  lang: "en",
  size: 8pt,
)

#import "@local/ling-utils:0.1.0": nosp
#let kk1 = [k#nosp[ˀ]₁]
#let kk2 = [k#nosp[ˀ]₂]
#let sc(body) = smallcaps(body)

#show: clong-dict.with(
  title: [Classical Seyvou Dictionary],
  subtitle: [The Panidan Languages],
  author: [Submerg],

  types: (
    noun: (sym: "N",
      infl: [decl.],
      forms: (
        dat: [_dat._],
        voc: [_voc._],
      ),
      cats: ("class",)
    ),
    adjective: (sym: "ADJ",
      infl: [decl.],
    ),
    verb: (sym: "V",
      infl: [conj.],
      cats: ("trans",)
    ),
    post: (sym: "POST")
  ),
)

/********************
 **  FRONT MATTER  **
 ********************/
#show: front-matter

= Nomenclature
_Languages_
/ CSv : Classical Seyvou
/ Kt : Kotarrozen
/ Ôt : Ôtìcosiàn
/ pKS : proto-Kotarro-Seyvic
/ Sv : Seyvou
/ VSv : Vulgar Seyvou
/ Wç : Woçoan

_Parts of speech (and their associated principle forms and categories)_
/ AFX : Affix _(N.B. The type of affix is indicated by the punctuation present on the dictionary entry.  When applicable, appropriate principle forms will be included in the dictionary entry.)_
/ ADJ : Adjective
/ DEM : Demonstrative
/ N : noun
  - Animacy
    / a : Animate
    / h : Human
    / n : Inanimate
/ POST : Postposition
/ PTCL : Particle
/ V : Verb
  - Transitivity
    / tr : Transitive
    / ntr : Intransitive
    / dtr : Ditransitive

_Abbreviations for use in argument definitions_

Argument definitions are formed by specifying _which_ argument (e.g., #sc[[do]]), then appending the form of that argument, prefixed with a colon (e.g., #sc[:sth]).
/ #sc[[do]] : Direct object.
/ #sc[[io]] : Indirect object.
/ #sc[:sb] : Somebody; an argument of a verb which is a person.
/ #sc[:sth] : Something; an argument of a verb which is a thing, i.e., not a person.
/ #sc[:v] : Verb; an argument of a verb which is a verb.
  / #sc[:v/f] : Finite verb, i.e., conjugated as its parent verb so as to form a serial verb construction.
  / #sc[:v/ii] : Indicative non-finite verb, i.e., a verb statically conjugated in the #sc[1s.pfv.ind].
  / #sc[:v/is] : Subjunctive non-finite verb, i.e., a verb statically conjugated in the #sc[1s.pfv.sjv].

/*******************
 **  MAIN MATTER  **
 *******************/
#show: main-matter

= A

= B

= Ḇ
ḇia /wɨːᴴ/ #entry("post") Concealing, especially when concealing from all applicable angles.

= C
cāfǫ /kʸąːf/ #entry("verb",
  cats: (trans: "ntr")
) To be clothed.  (_with _jozbau_)_  To wear.

cāfǫğą̄i /kʸaːfǫye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "cāfǫjǭi",
    voc: "cāfǫṯœ̨",
  )
) Clothing.

cāfǫğą̄i-ḇīa /kʸaːfǫyewɨːᴴ/ (From _cafǫğąi_ + _ḇia_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "cāfǫjǭi-ḇia",
    voc: "cāfǫṯœ̨-ḇia",
  )
) Chemise.

cāfǫḵoscğą̄i /kʸaːfǫ.oᴿye, -fǫːᴿ-/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "cāfǫḵoscjǭi",
    voc: "cāfǫkoscṯœ̨",
  )
) A type of shirt similar to a Victorian waistcoat.

cāfǫvaluiğą̄i /kʸaːfǫvəlüye/ (From _cafǫğąi_ + _valuiğąi_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "cāfǫvaluijǭi",
    voc: "cāfǫvaluiṯœ̨",
  )
) Skirt.

cāuağą̄i /kʸaːwəye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "cāwajǭi",
    voc: "cāwaṯœ̨",
  )
) Cloth. _(in the collective)_ Osecoyan veils.

= C̱
c̱ąlōjǫi /ə̨ᴸluᴸ/ #entry("adjective",
  forms: (infl: 1)
) Tall.

= CH
chǫi /sʸwi/ #entry("verb",
  cats: (trans: "dtr")
) To command.

chǫiğą̄i /sʸwįye/ #entry("noun",
  cats: (class: "h"),
  forms: (
    infl: 1,
    dat: "chǫijǭi",
    voc: "chǫiṯœ̨"
  )
) Queen, king, ruler.

chǫiğiẖ /sʸwįyᴴ/ (From _chǫiğąi_ + _-ğiẖ_.) #entry("verb",
  cats: (trans: "ntr")
) To reign.

chǫiğiẖğą̄i /sʸwįyiᴴye/ (Nominalization of _chǫiğiẖ_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 2,
    dat: "chǫiğiẖjǭi",
    voc: "chǫiğiẖṯœ̨"
  )
) Reign.


= D

= Ḏ
ḏēastulğą̄i /yəːᴴtülʸe/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ḏēastuljǭi",
    voc: "ḏēastulṯœ̨"
  )
) Fur.  _(in the plural)_ pelt.  A type of accessory made of fur and worn on the legs and arms.  Sock.

= E
ēstoğą̄i /eːᴴtoye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ēstojǭi",
    voc: "ēstoṯœ̨"
  )
) Tail.

ēstoğą̄i-ḇīa /eːᴴtoyewɨːᴴ/ (From _estoğąi_ + _ḇia_) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ēstojǭi-ḇīa",
    voc: "ēstoṯœ̨-ḇīa"
  )
) A women's garment consisting of a piece of fabric that covers the tail.

= F

= G

= Ğ
ğa /yə/ #entry("post") On. _(with time)_ At.  Covering, especially when that which is being covered is not fully obscured, or when that which is covering is not the object most directly responsible for fully obscuring that which is being covered. 

= H

= H̱
ẖochikorğą̄i /osʸikorʸe/ #entry("noun",
  cats: (class: "h"),
  forms: (
    infl: 1,
    dat: "ẖochikorjǭi",
    voc: "ẖochikorṯœ̨"
  )
) Osecoy.

ẖǭstğą̄i /ǫːᴴtʸe/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ẖǭstiǭi",
    voc: "ẖǭstoṯœ̨"
  )
) Mountain.


= I

= J
ji /zʸi/ #entry("post") At.

joc̱āğą̄i /zʸo.aːᴸye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "joc̱ājǭi",
    voc: "joc̱āṯœ̨",
  )
) Chest, torso, trunk.

joc̱āğą̄i-ğa /zʸo.aːᴸye/ (From _joc̱ağąi_ + _ğa_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "joc̱ājǭi-ğa",
    voc: "joc̱āṯœ̨-ğa",
  )
) Bodice.

= K

= Ḵ
ḵēluğą̄i /eːᴸlüye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ḵēlujǭi",
    voc: "ḵēluṯœ̨"
  )
) Mane.

ḵēluğą̄i-ğa /eːᴸlüyeyə/ (From _ḵeluğąi_ + _ğa_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "ḵēlujǭi-ğa",
    voc: "ḵēluṯœ̨-ğa"
  )
) sÈleysi, a type of male overgarment similar to a hooded cloak, but shorter, begin just long enough to fully cover the mane.

= L
liǫsi /lʸǫs/ #entry("verb",
  cats: (trans: "tr")
) To like, to want.

= M

= N
nolo /nol/ #entry("verb",
  cats: (trans: "ntr")
) Come.

naurctōzi /norᴴtoːz/ #entry("verb",
  forms: (infl: 1),
  cats: (trans: "ntr")
) Circle.

naurctōziğą̄i /norᴴtoːziye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "naurctōzijǭi",
    voc: "naurctōziṯœ̨"
  )
) Circle.

naurctōzilǭiğōi /norᴴtoːzilǫyyu/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "naurctōzilǭijōi",
    voc: "naurctōzilōisṯœ̨"
  )
) Belt.

neahiğą̄i /nə.iye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "neahijǭi",
    voc: "neahiṯœ̨"
  )
) Leg, arm.

neahiğą̄i-ḇīa /nə.iyewɨːᴴ/ (From _neahiğąi_ + _ḇia_.) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "neahijǭi-ḇīa",
    voc: "neahiṯœ̨-ḇīa"
  )
) Pants, trousers.

nœ̄ujacṯağą̄i /nʉːzʸəᴴsəᴸye/ #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "nœ̄ujacṯajǭi",
    voc: "nœ̄ujacṯaṯœ̨"
  )
) Hand, foot.

nœ̄ujacṯağą̄i-ḇīa /nʉːzʸəᴴsəᴸyewɨːᴴ/ (From _nœujacṯağąi_ + _ḇia_) #entry("noun",
  cats: (class: "n"),
  forms: (
    infl: 1,
    dat: "nœ̄ujacṯajǭi-ḇīa",
    voc: "nœ̄ujacṯaṯœ̨-ḇīa"
  )
) Glove, shoe.

= O

= Œ

= P

= R

= S
stauhi /stoy/ #entry("post") With (a friend).

= T
tų̄dğą̄i /tų̈ᴸye/ #entry("noun",
  cats: (class: "an"),
  forms: (
    infl: 2,
    dat: "tų̄diǭi",
    voc: "tų̄duṯœ̨"
  )
) God.

= Ṯ
ṯairoğą̄i /seᴸroye/ #entry("noun",
  cats: (class: "h"),
  forms: (
    infl: 1,
    dat: "ṯairojǭi",
    voc: "ṯairoṯœ̨"
  )
) Child, kid.

= U

= V
vulār /vülaːr/ #entry("verb",
  cats: (trans: "tr")
) To want.

= W

= Z

/*******************
 **  BACK MATTER  **
 *******************/
#show: back-matter

= Declensions and Conjugations
  #figure(
    table(
      columns: 7,
      table.hline(),
      table.header(
        [],
        [DIR],
        [DAT],
        [GEN1],
        [GEN2],
        [GEN3],
        [VOC]
      ),
      table.hline(),
      [CLV], [-lǭiğōi], [-lǭijōi], [-lǭijōi-stauhi], [-lǭijōi-ji], [-lǭijōi-ğa], [-lōisṯœ̨],
      [SGV], [-lōiğōi], [-lōijōi], [-lōijōi-stauhi], [-lōijōi-ji], [-lōijōi-ğa], [-lōisṯœ],
      table.hline()
    ),
    caption: [Declension of _-lǫiğoi_]
  )
  
  == The Genitives
  Classical Seyvou has three genitives, glossed #smallcaps[gen1], #smallcaps[gen2], and #smallcaps[gen3].  These are used for animate alienable possession, inanimate alienable possession, and inalienable possesion, respectively.
