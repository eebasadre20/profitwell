RSpec.describe Profitwell do
  let(:headers) {
    {
      'Content-Type': Profitwell.content_type,
      'Authorization': Profitwell.access_token,
    }
  }

  context "Configuration" do
    it "Access token" do
      expect(Profitwell.access_token).to eq("sample_token")
    end

    it "Version" do
      expect(Profitwell.version).to eq("v2")
    end

    it "Base endpoint" do
      expect(Profitwell.base_endpoint).to eq("https://api.profitwell.com/v2")
    end
  end

  describe "Plans" do
    let(:mock_plans) { fixture('plans/all.json') }
    let(:mock_plan) { fixture('plans/plan.json') }
    let(:updated_mock_plan) { fixture('plans/updated_plan.json') }

    context "GET /plans" do
      before do
        stub_request(:get, Profitwell.base_endpoint + "/plans/")
          .with(headers: {
            'Content-Type': Profitwell.content_type,
            'Authorization': Profitwell.access_token,
          })
          .to_return(status: 200, body: mock_plans, headers: {:content_type => "application/json; charset=utf-8"})
      end

      it "should get correct resource" do
        Profitwell.plans.all
        expect(a_request(:get, Profitwell.base_endpoint + "/plans/").
            with(headers: headers)).to have_been_made
      end

      it "should have list of plans" do
        plans = Profitwell.plans.all
        expect(plans).not_to be nil
        expect(plans.count).to eq(4)
      end
    end

    context "GET /plans/:id" do
      before do
        stub_request(:get, Profitwell.base_endpoint + "/plans/1/")
          .with(headers:     {
            'Content-Type': Profitwell.content_type,
            'Authorization': Profitwell.access_token,
          })
          .to_return(status: 200, body: mock_plan, headers: {:content_type => "application/json; charset=utf-8"})
      end

      it "should get correct resource" do
        Profitwell.plans.find(1)
        expect(a_request(:get, Profitwell.base_endpoint + "/plans/1/").
            with(headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            })).to have_been_made
      end

      it "should get free plan id" do
        plan = Profitwell.plans.find(1)
        expect(plan.id).to eq "free-plan"
      end
    end

    context "GET /plans/:invalid_id" do
      before do
        stub_request(:get, Profitwell.base_endpoint + "/plans/1/")
          .with(headers: {
            'Content-Type': Profitwell.content_type,
            'Authorization': Profitwell.access_token,
          })
          .to_raise(Profitwell::BadRequest)
      end

      it "should raise error BadRequest" do
        expect { Profitwell.plans.find(1) }.to raise_error(Profitwell::BadRequest)
      end
    end

    context "POST /plans" do
      before do
        stub_request(:post, Profitwell.base_endpoint + "/plans/")
          .with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: JSON.parse(mock_plan)
          )
          .to_return(status: 201, body: mock_plan, headers: {:content_type => "application/json; charset=utf-8"})
      end

      it "should post correct resource" do
        Profitwell.plans.create({
          "id": "free-plan",
          "name": "Free subscription plan"
        })

        expect(a_request(:post, Profitwell.base_endpoint + "/plans/").
          with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: JSON.parse(mock_plan)
          )
        ).to have_been_made
      end

      it "should return posted plan" do
        plan = Profitwell.plans.create({
          "id": "free-plan",
          "name": "Free subscription plan"
        })

        expect(plan.id).to eq "free-plan"
      end
    end

    context "POST invalid /plans" do
      before do
        stub_request(:post, Profitwell.base_endpoint + "/plans/")
          .with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: JSON.parse(mock_plan)
          )
          .to_raise(Profitwell::BadRequest.new("A plan with this ID already exists"))
      end

      it "should raise error BadRequest plan id already exist" do
        expect { Profitwell.plans.create({
          "id": "free-plan",
          "name": "Free subscription plan"
        }) }.to raise_error(Profitwell::BadRequest, "A plan with this ID already exists")
      end
    end

    context "PUT /plans/:id" do
      before do
        stub_request(:put, Profitwell.base_endpoint + "/plans/free-plan/")
          .with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: { "name": "Updated Free subscription plan" }
          )
          .to_return(status: 200, body: updated_mock_plan, headers: {:content_type => "application/json; charset=utf-8"})
      end

      it "should get correct resource" do
        Profitwell.plans.update("free-plan", { "name": "Updated Free subscription plan" })
        expect(a_request(:put, Profitwell.base_endpoint + "/plans/free-plan/")
          .with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: { "name": "Updated Free subscription plan" }
          )
        ).to have_been_made
      end

      it "should update the plan name" do
        plan_updated = Profitwell.plans.update("free-plan", { "name": "Updated Free subscription plan" })
        expect(plan_updated.name).to eq "Updated Free subscription plan"
      end
    end

    context "PUT invalid /plans/:id" do
      before do
        stub_request(:put, Profitwell.base_endpoint + "/plans/invalid-plan-id/")
          .with(
            headers: {
              'Content-Type': Profitwell.content_type,
              'Authorization': Profitwell.access_token,
            },
            body: { "name": "Updated Free subscription plan" }
          )
          .to_raise(Profitwell::BadRequest.new("There is no plan with this ID"))
      end

      it "should raise error no plan with this ID" do
        expect {
          Profitwell.plans.update("invalid-plan-id", { "name": "Updated Free subscription plan" })
        }.to raise_error(Profitwell::BadRequest, "There is no plan with this ID")
      end
    end
  end
end
