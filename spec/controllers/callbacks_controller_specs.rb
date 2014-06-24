describe CallbacksController do
  describe 'GET #callback' do
    context "when the request doesn't contain hub.challenge"  do
      it 'renders nothing' do
        get :callback

        expect(response.body).to be("")
      end
    end
  end
end
