require 'spec_helper'

ROOT = File.expand_path(File.dirname(__FILE__))
SAMPLE_1 = File.read(File.join(ROOT, 'sample_configs', 'sample_1')).freeze

module JunosConfig
  describe Config do
    describe 'initialized with sample config 1' do
      before :each do
        @config = JunosConfig::Config.new SAMPLE_1
      end

      it 'should have 9 interfaces' do
        expect(@config.interfaces.size).to eq(9)
      end
      describe 'interface 0' do
        it 'should be named ge-0/0/0' do expect(@config.interfaces[0].name).to eq('ge-0/0/0') end
      end
      describe 'interface 1' do
        it 'should be named ge-0/0/1' do expect(@config.interfaces[1].name).to eq('ge-0/0/1') end
      end
      describe 'interface 2' do
        it 'should be named ge-2/0/0' do expect(@config.interfaces[2].name).to eq('ge-2/0/0') end
      end
      describe 'interface 3' do
        it 'should be named ge-2/0/1' do expect(@config.interfaces[3].name).to eq('ge-2/0/1') end
      end
      describe 'interface 4' do
        it 'should be named fab0' do expect(@config.interfaces[4].name).to eq('fab0') end
      end
      describe 'interface 5' do
        it 'should be named fab1' do expect(@config.interfaces[5].name).to eq('fab1') end
      end
      describe 'interface 6' do
        it 'should be named reth0' do expect(@config.interfaces[6].name).to eq('reth0') end
      end
      describe 'interface 7' do
        it 'should be named reth1' do expect(@config.interfaces[7].name).to eq('reth1') end
      end
      describe 'interface 8' do
        it 'should be named st0' do expect(@config.interfaces[8].name).to eq('st0') end
      end

      it 'should have 3 security zones' do
        expect(@config.security_zones.size).to eq(3)
      end
      describe 'security zone 0' do
        it 'should be named trust' do expect(@config.security_zones[0].name).to eq('trust') end
      end
      describe 'security zone 1' do
        it 'should be named untrust' do expect(@config.security_zones[1].name).to eq('untrust') end
      end
      describe 'security zone 2' do
        it 'should be named vpn' do expect(@config.security_zones[2].name).to eq('vpn') end
      end

      it 'should have 6 security policies' do
        expect(@config.security_policies.size).to eq(6)
      end
      describe 'security policy 0' do
        it 'should be named trust-to-untrust' do expect(@config.security_policies[0].name).to eq('trust-to-untrust') end
        it 'should be from zone security zone 0 (trust)' do expect(@config.security_policies[0].from_zone).to eq(@config.security_zones[0]) end
        it 'should be to zone security zone 1 (untrust)' do expect(@config.security_policies[0].to_zone).to eq(@config.security_zones[1]) end
      end
      describe 'security policy 1' do
        it 'should be named FromVPN' do expect(@config.security_policies[1].name).to eq('FromVPN') end
        it 'should be from zone security zone 2 (vpn)' do expect(@config.security_policies[1].from_zone).to eq(@config.security_zones[2]) end
        it 'should be to zone security zone 0 (trust)' do expect(@config.security_policies[1].to_zone).to eq(@config.security_zones[0]) end
      end
      describe 'security policy 2' do
        it 'should be named ToVpn' do expect(@config.security_policies[2].name).to eq('ToVpn') end
        it 'should be from zone security zone 0 (trust)' do expect(@config.security_policies[2].from_zone).to eq(@config.security_zones[0]) end
        it 'should be to zone security zone 2 (vpn)' do expect(@config.security_policies[2].to_zone).to eq(@config.security_zones[2]) end
      end
      describe 'security policy 3' do
        it 'should be named vpn-to-vpn' do expect(@config.security_policies[3].name).to eq('vpn-to-vpn') end
        it 'should be from zone security zone 2 (vpn)' do expect(@config.security_policies[3].from_zone).to eq(@config.security_zones[2]) end
        it 'should be to zone security zone 2 (vpn)' do expect(@config.security_policies[3].to_zone).to eq(@config.security_zones[2]) end
      end
      describe 'security policy 4' do
        it 'should be named voip' do expect(@config.security_policies[4].name).to eq('voip') end
        it 'should be from zone security zone 1 (untrust)' do expect(@config.security_policies[4].from_zone).to eq(@config.security_zones[1]) end
        it 'should be to zone security zone 0 (trust)' do expect(@config.security_policies[4].to_zone).to eq(@config.security_zones[0]) end
      end
      describe 'security policy 5' do
        it 'should be named test-rails' do expect(@config.security_policies[5].name).to eq('test-rails') end
        it 'should be from zone security zone 1 (untrust)' do expect(@config.security_policies[5].from_zone).to eq(@config.security_zones[1]) end
        it 'should be to zone security zone 0 (trust)' do expect(@config.security_policies[5].to_zone).to eq(@config.security_zones[0]) end
      end
    end
  end
end
