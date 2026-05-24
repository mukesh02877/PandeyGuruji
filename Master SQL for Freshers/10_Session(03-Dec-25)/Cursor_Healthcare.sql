-- Cursor:

--Step-by-Step Billing Processing
--For each visit:Calculate FinalPayableAmount, Update BillingStatus = 'PROCESSED'

--Select * from Patient_Visit


DECLARE
    @VisitID INT,
    @TreatmentCost DECIMAL(10,2),
    @CoveragePercent INT,
    @FinalAmount DECIMAL(10,2);

--1. Declare Cursor
DECLARE BillingCursor CURSOR
FOR
SELECT VisitID, TreatmentCost, InsuranceCoveragePercent
FROM Patient_Visit
WHERE BillingStatus = 'PENDING';

--2. Open Cursor
OPEN BillingCursor;

--3 Fetch First Row
FETCH NEXT FROM BillingCursor
INTO @VisitID, @TreatmentCost, @CoveragePercent;

-- Loop Through Rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calculate payable amount
    SET @FinalAmount = @TreatmentCost
                       - (@TreatmentCost * @CoveragePercent / 100.0);

    -- Update row
    UPDATE Patient_Visit
    SET FinalPayableAmount = @FinalAmount,
        BillingStatus = 'PROCESSED'
    WHERE VisitID = @VisitID;

    -- Fetch Next Row
    FETCH NEXT FROM BillingCursor
    INTO @VisitID, @TreatmentCost, @CoveragePercent;
END

--4. Close and Deallocate
CLOSE BillingCursor;
DEALLOCATE BillingCursor;
