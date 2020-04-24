require 'features/streamer'

RSpec.describe ElevatorMedia::Streamer do
    
    # describe "testingRspec" do
    #     context 'testing rspec with hello world' do
    #         it 'returns hello world' do
    #             expect(described_class.testingRspec).to eq("hello world")
    #         end
    #     end
    # end

    describe "getContent" do
        context 'test for returning valid html' do
            it 'returns a string that starts and end with a div tag' do
                # described_class.stub(:randomNumberGenerator).and_return(5)
                # expect(described_class).to receive(:wrapIFrame).with(described_class.pickVideoFromList(5)).and_return("<iframe src='https://www.youtube.com/embed/O3RjIKvOL5c'></iframe>")
                expect(described_class.getContent.start_with?("<div>")).to be(true)
                expect(described_class.getContent.end_with?("</div>")).to be(true)
            end
        end
    end

    # describe "testPrivateMethod" do
    #     context 'testing private methods' do
    #         it 'returns input' do
    #             expect(described_class.testPrivateMethod("test")).to eq("test")
    #         end
    #     end
    # end

    describe "wrapIFrame" do
        context 'test for wrapping the input with an iframe' do
            it 'returns a valid iframe' do
                expect(described_class.wrapIFrame("Abc23456789")).to eq("<iframe src='https://www.youtube.com/embed/Abc23456789' height='720' width='1280' allowfullscreen></iframe>")
            end
        end
    end

    describe "getYtVideoList" do
        context 'test the youtube api for search ' do
            it 'returns a JSON object as a string' do

                expect(described_class.getYtVideoList).to be_an_instance_of(String)
            end
        end
    end

    describe "pickVideoFromList" do
        context 'test for getting a video ID from the list' do
            it 'returns a string of length 11' do
                expect(described_class.pickVideoFromList.length).to be(11)
            end
        end
    end

end