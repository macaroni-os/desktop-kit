# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
LANGUAGES="
  ab af am ar as ast be bg bn bn-IN bo br brx bs ca ca-valencia
  ckb cs cy da de dgo dsb dz el en-GB en-ZA eo es et eu fa fi fr
  fur fy ga gd gl gu gug he hi hr hsb hu hy id is it ja ka kab kk
  km kmr-Latn kn ko kok ks lb lo lt lv mai mk ml mn mni mr my nb
  ne nl nn nr nso oc om or pa-IN pl pt pt-BR ro ru rw sa-IN sat
  sat-Olck sd si sid sk sl sq sr sr-Latn ss st sv sw-TZ szl ta te
  tg th tl tn tr ts tt ug uk uz ve vec vi xh zh-CN zh-TW zu
"

inherit rpm

DESCRIPTION="Translations for the Libreoffice suite"
HOMEPAGE="https://www.libreoffice.org"
SRC_URI="
l10n_ab? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ab.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ab.tar.gz )
l10n_af? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_af.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_af.tar.gz )
l10n_am? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_am.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_am.tar.gz )
l10n_ar? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ar.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ar.tar.gz )
l10n_as? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_as.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_as.tar.gz )
l10n_ast? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ast.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ast.tar.gz )
l10n_be? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_be.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_be.tar.gz )
l10n_bg? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_bg.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_bg.tar.gz )
l10n_bn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_bn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_bn.tar.gz )
l10n_bn-IN? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_bn-IN.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_bn-IN.tar.gz )
l10n_bo? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_bo.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_bo.tar.gz )
l10n_br? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_br.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_br.tar.gz )
l10n_brx? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_brx.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_brx.tar.gz )
l10n_bs? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_bs.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_bs.tar.gz )
l10n_ca? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ca.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ca.tar.gz )
l10n_ca-valencia? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ca-valencia.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ca-valencia.tar.gz )
l10n_ckb? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ckb.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ckb.tar.gz )
l10n_cs? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_cs.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_cs.tar.gz )
l10n_cy? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_cy.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_cy.tar.gz )
l10n_da? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_da.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_da.tar.gz )
l10n_de? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_de.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_de.tar.gz )
l10n_dgo? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_dgo.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_dgo.tar.gz )
l10n_dsb? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_dsb.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_dsb.tar.gz )
l10n_dz? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_dz.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_dz.tar.gz )
l10n_el? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_el.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_el.tar.gz )
l10n_en-GB? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_en-GB.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_en-GB.tar.gz )
l10n_en-ZA? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_en-ZA.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_en-ZA.tar.gz )
l10n_eo? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_eo.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_eo.tar.gz )
l10n_es? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_es.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_es.tar.gz )
l10n_et? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_et.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_et.tar.gz )
l10n_eu? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_eu.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_eu.tar.gz )
l10n_fa? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_fa.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_fa.tar.gz )
l10n_fi? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_fi.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_fi.tar.gz )
l10n_fr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_fr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_fr.tar.gz )
l10n_fur? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_fur.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_fur.tar.gz )
l10n_fy? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_fy.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_fy.tar.gz )
l10n_ga? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ga.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ga.tar.gz )
l10n_gd? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_gd.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_gd.tar.gz )
l10n_gl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_gl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_gl.tar.gz )
l10n_gu? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_gu.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_gu.tar.gz )
l10n_gug? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_gug.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_gug.tar.gz )
l10n_he? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_he.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_he.tar.gz )
l10n_hi? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_hi.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_hi.tar.gz )
l10n_hr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_hr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_hr.tar.gz )
l10n_hsb? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_hsb.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_hsb.tar.gz )
l10n_hu? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_hu.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_hu.tar.gz )
l10n_hy? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_hy.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_hy.tar.gz )
l10n_id? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_id.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_id.tar.gz )
l10n_is? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_is.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_is.tar.gz )
l10n_it? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_it.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_it.tar.gz )
l10n_ja? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ja.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ja.tar.gz )
l10n_ka? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ka.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ka.tar.gz )
l10n_kab? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_kab.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_kab.tar.gz )
l10n_kk? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_kk.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_kk.tar.gz )
l10n_km? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_km.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_km.tar.gz )
l10n_kmr-Latn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_kmr-Latn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_kmr-Latn.tar.gz )
l10n_kn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_kn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_kn.tar.gz )
l10n_ko? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ko.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ko.tar.gz )
l10n_kok? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_kok.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_kok.tar.gz )
l10n_ks? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ks.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ks.tar.gz )
l10n_lb? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_lb.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_lb.tar.gz )
l10n_lo? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_lo.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_lo.tar.gz )
l10n_lt? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_lt.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_lt.tar.gz )
l10n_lv? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_lv.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_lv.tar.gz )
l10n_mai? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_mai.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_mai.tar.gz )
l10n_mk? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_mk.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_mk.tar.gz )
l10n_ml? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ml.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ml.tar.gz )
l10n_mn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_mn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_mn.tar.gz )
l10n_mni? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_mni.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_mni.tar.gz )
l10n_mr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_mr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_mr.tar.gz )
l10n_my? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_my.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_my.tar.gz )
l10n_nb? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_nb.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_nb.tar.gz )
l10n_ne? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ne.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ne.tar.gz )
l10n_nl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_nl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_nl.tar.gz )
l10n_nn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_nn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_nn.tar.gz )
l10n_nr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_nr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_nr.tar.gz )
l10n_nso? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_nso.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_nso.tar.gz )
l10n_oc? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_oc.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_oc.tar.gz )
l10n_om? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_om.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_om.tar.gz )
l10n_or? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_or.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_or.tar.gz )
l10n_pa-IN? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_pa-IN.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_pa-IN.tar.gz )
l10n_pl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_pl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_pl.tar.gz )
l10n_pt? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_pt.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_pt.tar.gz )
l10n_pt-BR? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_pt-BR.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_pt-BR.tar.gz )
l10n_ro? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ro.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ro.tar.gz )
l10n_ru? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ru.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ru.tar.gz )
l10n_rw? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_rw.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_rw.tar.gz )
l10n_sa-IN? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sa-IN.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sa-IN.tar.gz )
l10n_sat? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sat.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sat.tar.gz )
l10n_sat-Olck? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sat-Olck.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sat-Olck.tar.gz )
l10n_sd? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sd.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sd.tar.gz )
l10n_si? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_si.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_si.tar.gz )
l10n_sid? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sid.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sid.tar.gz )
l10n_sk? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sk.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sk.tar.gz )
l10n_sl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sl.tar.gz )
l10n_sq? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sq.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sq.tar.gz )
l10n_sr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sr.tar.gz )
l10n_sr-Latn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sr-Latn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sr-Latn.tar.gz )
l10n_ss? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ss.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ss.tar.gz )
l10n_st? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_st.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_st.tar.gz )
l10n_sv? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sv.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sv.tar.gz )
l10n_sw-TZ? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_sw-TZ.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_sw-TZ.tar.gz )
l10n_szl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_szl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_szl.tar.gz )
l10n_ta? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ta.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ta.tar.gz )
l10n_te? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_te.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_te.tar.gz )
l10n_tg? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_tg.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_tg.tar.gz )
l10n_th? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_th.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_th.tar.gz )
l10n_tl? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_tl.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_tl.tar.gz )
l10n_tn? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_tn.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_tn.tar.gz )
l10n_tr? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_tr.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_tr.tar.gz )
l10n_ts? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ts.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ts.tar.gz )
l10n_tt? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_tt.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_tt.tar.gz )
l10n_ug? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ug.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ug.tar.gz )
l10n_uk? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_uk.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_uk.tar.gz )
l10n_uz? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_uz.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_uz.tar.gz )
l10n_ve? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_ve.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_ve.tar.gz )
l10n_vec? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_vec.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_vec.tar.gz )
l10n_vi? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_vi.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_vi.tar.gz )
l10n_xh? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_xh.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_xh.tar.gz )
l10n_zh-CN? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_zh-CN.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_zh-CN.tar.gz )
l10n_zh-TW? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_zh-TW.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_zh-TW.tar.gz )
l10n_zu? ( https://tdf.mirror.garr.it/libreoffice/testing/25.8.2/rpm/x86_64/LibreOffice_25.8.2.1_Linux_x86-64_rpm_langpack_zu.tar.gz -> libreoffice-l10n-25.8.2.1_rpm_langpack_zu.tar.gz )"
LICENSE="|| ( LGPL-3 MPL-1.1 )"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64 l10n_ab l10n_af l10n_am l10n_ar l10n_as l10n_ast
l10n_be l10n_bg l10n_bn l10n_bn-IN l10n_bo l10n_br l10n_brx l10n_bs l10n_ca
l10n_ca-valencia l10n_ckb l10n_cs l10n_cy l10n_da l10n_de l10n_dgo l10n_dsb
l10n_dz l10n_el l10n_en-GB l10n_en-ZA l10n_eo l10n_es l10n_et l10n_eu l10n_fa
l10n_fi l10n_fr l10n_fur l10n_fy l10n_ga l10n_gd l10n_gl l10n_gu l10n_gug l10n_he
l10n_hi l10n_hr l10n_hsb l10n_hu l10n_hy l10n_id l10n_is l10n_it l10n_ja l10n_ka
l10n_kab l10n_kk l10n_km l10n_kmr-Latn l10n_kn l10n_ko l10n_kok l10n_ks l10n_lb
l10n_lo l10n_lt l10n_lv l10n_mai l10n_mk l10n_ml l10n_mn l10n_mni l10n_mr l10n_my
l10n_nb l10n_ne l10n_nl l10n_nn l10n_nr l10n_nso l10n_oc l10n_om l10n_or l10n_pa-IN
l10n_pl l10n_pt l10n_pt-BR l10n_ro l10n_ru l10n_rw l10n_sa-IN l10n_sat l10n_sat-Olck
l10n_sd l10n_si l10n_sid l10n_sk l10n_sl l10n_sq l10n_sr l10n_sr-Latn l10n_ss
l10n_st l10n_sv l10n_sw-TZ l10n_szl l10n_ta l10n_te l10n_tg l10n_th l10n_tl
l10n_tn l10n_tr l10n_ts l10n_tt l10n_ug l10n_uk l10n_uz l10n_ve l10n_vec
l10n_vi l10n_xh l10n_zh-CN l10n_zh-TW l10n_zu
"
RESTRICT="strip"
RDEPEND="app-text/hunspell
	
"
S="${WORKDIR}"
src_prepare() {
	default
	local lang dir rpmdir version
	# First remove dictionaries, we want to use system ones.
	find "${S}" -name *dict*.rpm -delete || die "Failed to remove dictionaries"
	for lang in ${LANGUAGES}; do
	  # Sometimes the packs can have differing versions from the main ebuild. In this case,
	  # we encode the version in a trailing "/{version}". If this is missing, just use ${PV}.
	  version=${lang##*/}
	  [ "${version}" == "${lang}" ] && version="${PV}"
	  lang=${lang%/*}
	  # break away if not enabled
	  use l10n_${lang%:*} || continue
	  dir=${lang#*:}
	  if [[ ${lang%:*} != en ]]; then
	    rpmdir="LibreOffice_${version}_Linux_x86-64_rpm_langpack_${dir}/RPMS/"
	    [[ -d ${rpmdir} ]] || die "Missing directory: ${rpmdir}"
	    rpm_unpack ./${rpmdir}/*.rpm
	  fi
	done
}
src_configure() { :; }
src_compile() { :; }
src_install() {
	local dir="${S}"/opt/${PN/-l10n/}$(ver_cut 1-2)/
	if [[ -d "${dir}" ]] ; then
	  insinto /usr/$(get_libdir)/${PN/-l10n/}/
	  doins -r "${dir}"/*
	fi
	# remove extensions that are in l10n for some weird reason
	rm -rf "${ED}"/usr/$(get_libdir)/${PN/-l10n/}/share/extensions/ || \
	  die "Failed to remove extensions"
}


# vim: filetype=ebuild
