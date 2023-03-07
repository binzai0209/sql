[
insert into AI_SIMPLEDATA.t_sd_base(extnum, zrzbdcdyid, location, centerdistance, centerangle, qxdm, fwbm, hbdcdyid,
                                    zcs, qsc, szc, jzmj, tnmj, cx, fwyt3, fwyt4, fwxz, fh, dyh, dscs, dxcs, jzjg, yt,
                                    zdmj, qlxz, communityid, zds, zhs, jcnd, rjl, lhl, kfs, wygs, tcw, wqjg, wqsj,
                                    sqrlx)
select te2.extnum,
       te2.zrzbdcdyid,
       te2.location,
       te2.centerdistance,
       te2.centerangle,
       te2.qxdm,
       te2.fwbm,
       te2.hbdcdyid,
       te2.zcs,
       te2.qsc,
       te2.szc,
       te2.jzmj,
       te2.tnmj,
       te2.cx,
       te2.fwyt3,
       te2.fwyt4,
       te2.fwxz,
       fh,
       te2.dyh,
       te2.dscs,
       te2.dxcs,
       te2.jzjg,
       te2.yt,
       te2.zdmj,
       te2.qlxz,
       te2.id                                 communityid,
       te2.zds,
       te2.zhs,
       nvl(nvl(te2.jcnd, te2.jgsj), te2.jgrq) jcnd,
       te2.rjl,
       te2.lhl,
       te2.kfs,
       te2.wygs,
       te2.tcw,
       te1.wqjg,
       te1.ymd                                wqsj,
       te1.sqrlx
from (select t1.ywh, t1.fwbh, t1.bdcdyh, t1.wqjg, t1.ymd, t1.sqrlx
      from jnpg.t_data_wqjg t1
      where t1.ywlx = '商品房网签'
        and length(t1.fwbh) > 3
        and t1.fwbh is not null
      union all
      select t2.ywh, t2.fwbh, t2.bdcdyh, t2.wqjg, t2.ymd, t2.qlrlx
      from jnpg.t_data_wqjg2 t2
      where t2.djlb = '合同备案-设立登记-商品房备案'
        and length(t2.fwbh) > 3) te1,
     (select t.extnum,
             t.bdcdyid                zrzbdcdyid,
             t.location,
             round(t.centerdistance)  centerdistance,
             round(t.centerangle)     centerangle,
             h.qxdm,
             h.fwbm,
             h.bdcdyid                hbdcdyid,
             h.zcs,
             h.qsc,
             h.szc,
             h.scjzmj                 jzmj,
             h.sctnjzmj               tnmj,
             h.cx,
             h.fwyt3,
             h.fwyt4,
             h.fwxz,
             nvl(h.fh, h.tqhh)        fh,
             h.dyh,
             to_char(h.jgsj, 'yyyy')  jgsj,
             z.dscs,
             z.dxcs,
             to_char(z.jgrq, 'yyyy')  jgrq,
             to_char(z.chsj, 'yyyy')  chsj,
             z.jzjg,
             d.yt,
             d.zdmj,
             d.qlxz,
             c.id,
             replace(c.zds, '栋', '') zds,
             replace(c.zhs, '户', '') zhs,
             c.jcnd,
             c.rjl,
             c.lhl,
             c.kfs,
             c.wygs,
             round(c.tcw)             tcw
      from AI_SIMPLEDATA.T_EXTENT_ZRZ t
               left join jnpg.t_base_h_xz h on h.zrzbdcdyid = t.bdcdyid
               left join jnpg.t_base_zrz_xz z on z.bdcdyid = t.bdcdyid
               left join jnpg.t_base_zd_xz d on z.zdbdcdyid = d.bdcdyid
               left join jnpg.v_community_gl_zrz vcz on z.bdcdyid = vcz.ZRZBDCDYID
               left join jnpg.t_base_community c on vcz.COMMUNITY_ID = c.id
      where t.extnum = 'sd017') te2
where te1.fwbh = te2.fwbm];