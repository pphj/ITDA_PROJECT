package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class KakaoPayApproval {
	private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private int total_amount;
    private Amount Amount;
    private Card_Info card_info;
    private String item_name, item_code, payload;
    private int quantity, tax_free_amount, vat_amount;
    private Timestamp created_at, approved_at;
}
