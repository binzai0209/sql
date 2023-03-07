select qxdm,
       bdcdyid                                                           zrzbdcdyid,
       zl                                                                zrz_zl,
       zdbdcdyid,
       zt_sync,
       delete_flag,
       community_id,
       row_number() over (partition by bdcdyid order by createtime desc) f
from (select z.qxdm,
                   z.zl,
                   z.bdcdyid,
                   z.zdbdcdyid,
                   gd.community_id,
                   gd.createtime,
                   z.zt_sync,
                   z.delete_flag
            from t_base_zrz_xz z,
                 t_commty_gl_zd gd
            where z.zdbdcdyid = gd.zd_id and BDCDYID = '684021'
            union all
            select z.qxdm,
                   z.zl,
                   z.bdcdyid,
                   z.zdbdcdyid,
                   gz.community_id,
                   gz.createtime,
                   z.zt_sync,
                   z.delete_flag
            from t_base_zrz_xz z,
                 t_commty_gl_zrz gz
            where z.bdcdyid = gz.zrzbdcdyid and BDCDYID = '684021'  )
where BDCDYID = '684021';


select *
from (select qxdm,
             bdcdyid                                                           zrzbdcdyid,
             zl                                                                zrz_zl,
             zdbdcdyid,
             zt_sync,
             delete_flag,
             community_id,
             row_number() over (partition by bdcdyid order by createtime desc) f
      from (
            select z.qxdm,
                   z.zl,
                   z.bdcdyid,
                   z.zdbdcdyid,
                   gd.community_id,
                   gd.createtime,
                   z.zt_sync,
                   z.delete_flag
            from t_base_zrz_xz z,
                 t_commty_gl_zd gd
            where z.zdbdcdyid = gd.zd_id and COMMUNITY_ID = '333980427918912282'
            union all
            select z.qxdm,
                   z.zl,
                   z.bdcdyid,
                   z.zdbdcdyid,
                   gz.community_id,
                   gz.createtime,
                   z.zt_sync,
                   z.delete_flag
            from t_base_zrz_xz z,
                 t_commty_gl_zrz gz
            where z.bdcdyid = gz.zrzbdcdyid and COMMUNITY_ID = '333980427918912282'
            ))
where COMMUNITY_ID = '333980427918912282';

