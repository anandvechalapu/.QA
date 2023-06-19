@app.route('/spouse_insurance', methods=['POST'])
def spouse_insurance():
    """
    Get spouse data from bank system and provide Ekyc/Ckyc interface
    if spouse data not available
    """
    # Get data from bank system
    try:
        data = request.get_json()
        data_dob = data['dob']
        data_crif = data['crif']
    except:
        return jsonify({'message': 'Data not provided!'}), 400

    # Check data
    if data_dob and data_crif:
        # Fetch spouse data from bank system
        spouse_data = fetch_spouse_data(data_dob, data_crif)

        if spouse_data:
            # Check eligibility
            if is_eligible(spouse_data):
                # Check credit score
                if spouse_data['credit_score']:
                    # Calculate sum assured
                    sum_assured = calculate_sum_assured(spouse_data['credit_score'])
                else:
                    # Assign minimum sum assured if credit score not provided
                    sum_assured = 50000
            else:
                # Spouse not eligible
                sum_assured = 0

            # Return response with sum assured
            return jsonify({'message': 'Success', 'sum_assured': sum_assured}), 200
        else:
            # No spouse data found, provide Ekyc/Ckyc interface
            return jsonify({'message': 'Provide Ekyc/Ckyc interface!'}), 400
    else:
        # Bad request
        return jsonify({'message': 'Bad Request'}), 400