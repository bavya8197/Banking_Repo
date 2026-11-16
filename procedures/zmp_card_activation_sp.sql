CREATE OR REPLACE PROCEDURE zmp_card_activation_sp
(
    p_card_id IN NUMBER
)
AS
BEGIN
    UPDATE zmp_card_tb
       SET card_status = 'ACTIVE'
     WHERE card_id = p_card_id;

    COMMIT;
END;
/