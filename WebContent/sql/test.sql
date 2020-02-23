select reply_key, user_key, reply_content, reply_date, board_key, reply_re_ref, reply_re_lev, reply_re_seq 
from reply where board_key = ? order by REPLY_RE_REF asc, REPLY_RE_SEQ asc


SELECT z.BOARD_KEY, z.USER_KEY, z.BOARD_TITLE, z.BOARD_DATE, z.BOARD_READCOUNT, ifnull(z.COMMENTCOUNT,0) REPLYCOUNT, ifnull(z.LIKECOUNT,0) LIKECOUNT, z.BOARD_CONTENT 
FROM (SELECT x.* 
FROM (SELECT * 
FROM board LEFT JOIN (SELECT BOARD_KEY, COUNT(*) LIKECOUNT 
FROM counts GROUP BY BOARD_KEY) D USING (BOARD_KEY) LEFT JOIN (SELECT BOARD_KEY, COUNT(*) COMMENTCOUNT 
FROM reply GROUP BY BOARD_KEY) C USING (BOARD_KEY)) x ) z WHERE USER_KEY=5 ORDER BY BOARD_DATE DESC limit ?, ?


delete from reply where reply_re_ref=? and reply_re_lev>=? and reply_re_seq>=? and reply_re_seq<(ifnull((select min(reply_re_seq) 
from reply ALIAS_FOR_SUBQUERY where reply_re_lev=? and reply_re_seq>? and reply_re_ref=?), (select max(reply_re_seq)+1 from reply ALIAS_FOR_SUBQUERY where reply_re_ref=?)))


delete from reply where reply_re_ref=83 and reply_re_lev>=1 and reply_re_seq>=1 and reply_re_seq<(ifnull(
(select min(reply_re_seq) 
from reply ALIAS_FOR_SUBQUERY where reply_re_lev=1 and reply_re_seq>1  and reply_re_ref=83), (select max(reply_re_seq)+1 from reply ALIAS_FOR_SUBQUERY where reply_re_ref=83)

SELECT z.BOARD_KEY, z.USER_KEY, z.BOARD_TITLE, z.BOARD_DATE, z.BOARD_READCOUNT, ifnull(z.COMMENTCOUNT,0) REPLYCOUNT, ifnull(z.LIKECOUNT,0) LIKECOUNT, z.BOARD_CONTENT 
FROM (SELECT x.* FROM (SELECT * 
FROM board LEFT JOIN (SELECT BOARD_KEY, COUNT(*) LIKECOUNT 
FROM counts GROUP BY BOARD_KEY) D USING (BOARD_KEY) LEFT JOIN (SELECT BOARD_KEY, COUNT(*) COMMENTCOUNT 
FROM reply GROUP BY BOARD_KEY) C USING (BOARD_KEY)) x ) z WHERE USER_KEY=5 ORDER BY BOARD_DATE DESC limit 0,7