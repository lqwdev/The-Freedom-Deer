import cleaning
import integration
import os
import csv


def main():
    print('[BEGIN]')

    trr = integration.integrate_trr()
    print('Finished processing trr_trr_refresh')
    
    trrstatus = integration.integrate_trr_status()
    print('Finished processing trr_trrstatus_refresh')

    # get all valid trr ids from trr
    trr_ids = set(trr['id'])

    # remove rows without valid trr ids
    trrstatus = trrstatus[trrstatus['trr_id'].isin(trr_ids)]

    # remove rows without valid trr ids
    weapondischarge = cleaning.process_weapondischarge()
    weapondischarge = weapondischarge[weapondischarge['trr_id'].isin(trr_ids)]
    print('Finished processing trr_weapondischarge_refresh')

    # remove rows without valid trr ids
    actionresponse = cleaning.process_actionresponse()
    actionresponse = actionresponse[actionresponse['trr_id'].isin(trr_ids)]
    print('Finished processing trr_actionresponse_refresh')

    # remove rows without valid trr ids
    charge = cleaning.process_charge()
    charge = charge[charge['trr_id'].isin(trr_ids)]
    print('Finished processing trr_charge_refresh')

    # remove rows without valid trr ids
    subjectweapon = cleaning.process_subjectweapon()
    subjectweapon = subjectweapon[subjectweapon['trr_id'].isin(trr_ids)]
    print('Finished processing trr_subjectweapon_refresh')

    # replace NULLs with empty string
    trr.replace('NULL', '', inplace=True)
    trr.fillna('', inplace=True)
    trrstatus.replace('NULL', '', inplace=True)
    trrstatus.fillna('', inplace=True)
    weapondischarge.replace('NULL', '', inplace=True)
    weapondischarge.fillna('', inplace=True)
    actionresponse.replace('NULL', '', inplace=True)
    actionresponse.fillna('', inplace=True)
    charge.replace('NULL', '', inplace=True)
    charge.fillna('', inplace=True)
    subjectweapon.replace('NULL', '', inplace=True)
    subjectweapon.fillna('', inplace=True)

    # create directory for output
    os.makedirs('output/', exist_ok=True)

    # write all dataframes to csv
    trr.to_csv('output/trr-trr.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)
    trrstatus.to_csv('output/trr-trrstatus.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)
    weapondischarge.to_csv('output/trr-weapondischarge.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)
    actionresponse.to_csv('output/trr-actionresponse.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)
    charge.to_csv('output/trr-charge.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)
    subjectweapon.to_csv('output/trr-subjectweapon.csv', index=False, quoting=csv.QUOTE_NONNUMERIC)

    print('END')



if __name__ == "__main__":
    main()
