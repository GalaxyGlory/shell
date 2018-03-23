select PACK_SERIAL,
       PACK_GLOBAL_SERIAL,
       CM_ID,
       FILE_TYPE,
       PACK_BODY,
       V_PACKAGE_NO,
       ISSUE_TIME,
       SENT_TIME,
       SENT_TIME + NUMTODSINTERVAL(40, 'SECOND') AS EXPIRED_TIME,
       SYSTIMESTAMP AS NOW_TIME,
       EXT_WAIT_ACK,
       TRY_COUNT,
       DEVICEID,
       EXT_PRIORITY
  from w_pack_send_queue
 where pack_serial in
       (select pack_serial
          from (select PACK_SERIAL,
                       row_number() over(partition by cm_id, ic_id, deviceid orde r by Pack_Serial asc) rn
                  from w_pack_send_queue
                 where EXT_WAIT_ACK = 1
                   AND CHECK_ERR = 0
                   AND IC_ID IN
                       (SELECT IC_ID FROM W_EQUIPMENT_INFO WHERE SERVER_NO = 1)
                   AND ACK_TIME IS NULL)
         where rn = 1)

  select PACK_SERIAL,
         PACK_GLOBAL_SERIAL,
         CM_ID,
         FILE_TYPE,
         PACK_BODY,
         V_PACKAGE_NO,
         ISSUE_TIME,
         SENT_TIME,
         SENT_TIME + NUMTODSINTERVAL(40, 'SECOND') AS EXPIRED_TIME,
         SYSTIMESTAMP AS NOW_TIME,
         EXT_WAIT_ACK,
         TRY_COUNT,
         DEVICEID,
         EXT_PRIORITY
          from w_pack_send_queue
         where pack_serial in
               (select pack_serial
                  from (select PACK_SERIAL,
                               row_number() over(partition by cm_id, ic_id, deviceid order by EXT_PRIORITY desc, Pack_Serial asc) rn
                          from w_pack_send_queue
                         where IC_ID IN (SELECT IC_ID
                                           FROM W_EQUIPMENT_INFO
                                          WHERE SERVER_NO = '1')
                           AND CHECK_ERR = 0
                           AND ACK_TIME IS NULL
                           AND EXT_WAIT_ACK = 1)
                 where rn = 1)
                 
                 
                 
        
          select PACK_SERIAL,
                 PACK_GLOBAL_SERIAL,
                 CM_ID,
                 FILE_TYPE,
                 PACK_BODY,
                 V_PACKAGE_NO,
                 ISSUE_TIME,
                 SENT_TIME,
                 SENT_TIME + NUMTODSINTERVAL(40, 'SECOND') AS EXPIRED_TIME,
                 SYSTIMESTAMP AS NOW_TIME,
                 EXT_WAIT_ACK,
                 TRY_COUNT,
                 DEVICEID,
                 EXT_PRIORITY
                  from w_pack_send_queue
                 where pack_serial in (select pack_serial
                                         from (select PACK_SERIAL,
                                                      row_number() over(partition by cm_id, ic_id, deviceid orde r by Pack_Serial asc) rn
                                                 from w_pack_send_queue
                                                where EXT_WAIT_ACK = 1
                                                  AND CHECK_ERR = 0
                                                  AND IC_ID IN
                                                      (SELECT IC_ID
                                                         FROM W_EQUIPMENT_INFO
                                                        WHERE SERVER_NO = 0)
                                                  AND ACK_TIME IS NULL)
                                        where rn = 1)
