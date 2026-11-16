CREATE OR REPLACE PROCEDURE zmp_card_activation_sp
(
    p_card_id IN NUMBER
)
AS
    v_status VARCHAR2(20);
BEGIN
    SELECT card_status
      INTO v_status
      FROM zmp_card_tb
     WHERE card_id = p_card_id;

    IF v_status IN ('BLOCKED', 'INACTIVE') THEN

        UPDATE zmp_card_tb
           SET card_status = 'ACTIVE'
         WHERE card_id = p_card_id;

        COMMIT;

    END IF;
END;
/