library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Speck_AXI_v2_0 is
    generic (
        -- Users to add parameters here
        BLOCK_SIZE: INTEGER := 64;
        KEY_SIZE: INTEGER := 96;
        -- User parameters ends
        -- Do not modify the parameters beyond this line
        
        
        -- Parameters of Axi Slave Bus Interface S00_AXI
        C_S00_AXI_DATA_WIDTH	: integer	:= 32;
        C_S00_AXI_ADDR_WIDTH	: integer	:= 7
    );
    port (
        -- Users to add ports here
        
        -- User ports ends
        -- Do not modify the ports beyond this line
        
        
        -- Ports of Axi Slave Bus Interface S00_AXI
        s00_axi_aclk    : in std_logic;
        s00_axi_aresetn : in std_logic;
        s00_axi_awaddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_awprot  : in std_logic_vector(2 downto 0);
        s00_axi_awvalid : in std_logic;
        s00_axi_awready : out std_logic;
        s00_axi_wdata   : in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_wstrb   : in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
        s00_axi_wvalid  : in std_logic;
        s00_axi_wready  : out std_logic;
        s00_axi_bresp   : out std_logic_vector(1 downto 0);
        s00_axi_bvalid  : out std_logic;
        s00_axi_bready  : in std_logic;
        s00_axi_araddr  : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_arprot  : in std_logic_vector(2 downto 0);
        s00_axi_arvalid : in std_logic;
        s00_axi_arready : out std_logic;
        s00_axi_rdata   : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_rresp   : out std_logic_vector(1 downto 0);
        s00_axi_rvalid  : out std_logic;
        s00_axi_rready  : in std_logic
    );
end Speck_AXI_v2_0;

architecture arch_imp of Speck_AXI_v2_0 is

    -- component declaration
    component Speck_AXI_v2_0_S00_AXI is
        generic (
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 7
        );
        port (
            ------------------ Ports to read from the registers ----------------- 
            -- Cipher data_in
            S_REG00_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1 downto 0);
            S_REG01_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG02_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG03_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            -- Cipher key
            S_REG04_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG05_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG06_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG07_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            S_REG08_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG09_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG10_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG11_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            -- Cipher nonce
            S_REG12_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG13_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            -- Cipher valid
            S_REG14_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1 downto 0);
            
            -- Cipher reset
            S_REG15_OUT: out STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            ----------------------------------------------------------------------
            
            ------------------ Ports to write to the registers -----------------
            -- Cipher data_out
            S_REG16_IN: in STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG17_IN: in STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG18_IN: in STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            S_REG19_IN: in STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            -- Cipher status (ready_changed, is_ready, ctr_wrap)
            -- ready_changed: Switches between '0' and '1' whenever ready is '1', 
            --                this allows to poll for changes from the AXI master.
            -- is_ready: Remains '1' once ready is '1' until reset occurs
            S_REG20_IN: in STD_LOGIC_VECTOR(C_S00_AXI_DATA_WIDTH - 1  downto 0);
            
            -- Reset valid if set to '1'
            S_RESET_VALID: in std_logic;
            --------------------------------------------------------------------
		
            S_AXI_ACLK      : in std_logic;
            S_AXI_ARESETN   : in std_logic;
            S_AXI_AWADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT    : in std_logic_vector(2 downto 0);
            S_AXI_AWVALID   : in std_logic;
            S_AXI_AWREADY   : out std_logic;
            S_AXI_WDATA     : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB     : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID    : in std_logic;
            S_AXI_WREADY    : out std_logic;
            S_AXI_BRESP     : out std_logic_vector(1 downto 0);
            S_AXI_BVALID    : out std_logic;
            S_AXI_BREADY    : in std_logic;
            S_AXI_ARADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT    : in std_logic_vector(2 downto 0);
            S_AXI_ARVALID   : in std_logic;
            S_AXI_ARREADY   : out std_logic;
            S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP     : out std_logic_vector(1 downto 0);
            S_AXI_RVALID    : out std_logic;
            S_AXI_RREADY    : in std_logic
        );
	end component Speck_AXI_v2_0_S00_AXI;

    component CTRSpeck
        generic (
            BLOCK_SIZE: INTEGER := 64;
            KEY_SIZE: INTEGER := 96
        );
        port (
            data_in: in UNSIGNED(BLOCK_SIZE - 1 downto 0); 
            key: in UNSIGNED(KEY_SIZE - 1 downto 0);
            nonce: in UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
            valid: in std_logic;
            clk: in std_logic;
            reset: in std_logic;
            data_out: out UNSIGNED(BLOCK_SIZE - 1 downto 0);
            reset_valid: out std_logic; 
            ready: out std_logic;
            ctr_wrap: out std_logic
        );
    end component;
    
    ------------------------- Signals for Speck_AXI_v2_0_S00_AXI ------------------------
    signal data_in_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_in_register_1: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_in_register_2: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_in_register_3: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal key_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_1: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_2: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_3: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_4: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_5: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_6: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal key_register_7: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);

    signal nonce_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal nonce_register_1: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal valid_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal cipher_ctrl_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal data_out_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_out_register_1: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_out_register_2: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal data_out_register_3: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal cipher_stat_register_0: std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    
    signal reset_valid_register_0: std_logic;
    -----------------------------------------------------------------------------------
    
    -------- Signals for CTRSpeck --------
    signal data_in: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    signal key: UNSIGNED(KEY_SIZE - 1 downto 0);
    signal nonce: UNSIGNED(BLOCK_SIZE / 2 - 1 downto 0);
    signal valid: std_logic;
    signal reset: std_logic;
    
    signal data_out: UNSIGNED(BLOCK_SIZE - 1 downto 0);
    signal reset_valid: std_logic;
    signal ready: std_logic;
    signal ctr_wrap: std_logic;
    ----------------------------------

begin

-- Instantiation of Axi Bus Interface S00_AXI
Speck_AXI_v2_0_S00_AXI_inst : Speck_AXI_v2_0_S00_AXI
    generic map (
        C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
    )
    port map (
        S_REG00_OUT => data_in_register_0,
        S_REG01_OUT => data_in_register_1,
        S_REG02_OUT => data_in_register_2,
        S_REG03_OUT => data_in_register_3,
        
        S_REG04_OUT => key_register_0,
        S_REG05_OUT => key_register_1,
        S_REG06_OUT => key_register_2,
        S_REG07_OUT => key_register_3,
        S_REG08_OUT => key_register_4,
        S_REG09_OUT => key_register_5,
        S_REG10_OUT => key_register_6,
        S_REG11_OUT => key_register_7,
        
        S_REG12_OUT => nonce_register_0,
        S_REG13_OUT => nonce_register_1,
        
        S_REG14_OUT => valid_register_0,
        
        S_REG15_OUT => cipher_ctrl_register_0,
        
        S_REG16_IN => data_out_register_0,
        S_REG17_IN => data_out_register_1,
        S_REG18_IN => data_out_register_2,
        S_REG19_IN => data_out_register_3,
        
        S_REG20_IN => cipher_stat_register_0,
        
        S_RESET_VALID => reset_valid_register_0,
        
        S_AXI_ACLK      => s00_axi_aclk,
        S_AXI_ARESETN   => s00_axi_aresetn,
        S_AXI_AWADDR    => s00_axi_awaddr,
        S_AXI_AWPROT    => s00_axi_awprot,
        S_AXI_AWVALID   => s00_axi_awvalid,
        S_AXI_AWREADY   => s00_axi_awready,
        S_AXI_WDATA     => s00_axi_wdata,
        S_AXI_WSTRB     => s00_axi_wstrb,
        S_AXI_WVALID    => s00_axi_wvalid,
        S_AXI_WREADY    => s00_axi_wready,
        S_AXI_BRESP     => s00_axi_bresp,
        S_AXI_BVALID    => s00_axi_bvalid,
        S_AXI_BREADY    => s00_axi_bready,
        S_AXI_ARADDR    => s00_axi_araddr,
        S_AXI_ARPROT    => s00_axi_arprot,
        S_AXI_ARVALID   => s00_axi_arvalid,
        S_AXI_ARREADY   => s00_axi_arready,
        S_AXI_RDATA     => s00_axi_rdata,
        S_AXI_RRESP     => s00_axi_rresp,
        S_AXI_RVALID    => s00_axi_rvalid,
        S_AXI_RREADY    => s00_axi_rready
    );

	-- Add user logic here
    Speck: CTRSpeck
        generic map (
            BLOCK_SIZE,
            KEY_SIZE
        )
        port map (
            data_in => data_in,
            key => key,
            nonce => nonce,
            valid => valid,
            clk => s00_axi_aclk,
            reset => reset,
            data_out => data_out,
            reset_valid => reset_valid,
            ready => ready,
            ctr_wrap => ctr_wrap
        );
        
    valid <= valid_register_0(0);    
    reset <= cipher_ctrl_register_0(0);
          
    cipher_stat_register_0(2) <= ctr_wrap;   
    reset_valid_register_0 <= reset_valid;
    
    process(s00_axi_aclk)
    begin
        if rising_edge(s00_axi_aclk) then
            if ready = '1' then
                if cipher_stat_register_0(0) = '0' then
                    cipher_stat_register_0(0) <= '1';
                else
                    cipher_stat_register_0(0) <= '0';
                end if;
                cipher_stat_register_0(1) <= '1';
            else
                cipher_stat_register_0(1) <= cipher_stat_register_0(1);
            end if;
        end if;
    end process;
        
    BLOCK_SIZE_32: if(BLOCK_SIZE=32) generate
        begin
            data_in <= unsigned(data_in_register_0);
            nonce <= unsigned(nonce_register_0(15 downto 0));
            
            data_out_register_0 <= std_logic_vector(data_out(31 downto 0));
            data_out_register_1 <= (others => '0');
            data_out_register_2 <= (others => '0');
            data_out_register_3 <= (others => '0');            
        end generate;
    
    BLOCK_SIZE_48: if(BLOCK_SIZE=48) generate
        begin
            data_in <= unsigned(data_in_register_1(15 downto 0) & 
                                       data_in_register_0);
            nonce <= unsigned(nonce_register_0(23 downto 0));
            
            data_out_register_0 <= std_logic_vector(data_out(31 downto 0));
            data_out_register_1 <= std_logic_vector(data_out(47 downto 32));
            data_out_register_2 <= (others => '0');
            data_out_register_3 <= (others => '0');  
        
        end generate;
        
    BLOCK_SIZE_64: if(BLOCK_SIZE=64) generate
        begin
            data_in <= unsigned(data_in_register_1 & 
                                       data_in_register_0);
            nonce <= unsigned(nonce_register_0);
            
            data_out_register_0 <= std_logic_vector(data_out(31 downto 0));
            data_out_register_1 <= std_logic_vector(data_out(63 downto 32));
            data_out_register_2 <= (others => '0');
            data_out_register_3 <= (others => '0'); 
        end generate;
        
    BLOCK_SIZE_96: if(BLOCK_SIZE=96) generate
        begin
            data_in <= unsigned(data_in_register_2 & 
                                       data_in_register_1 & 
                                       data_in_register_0);
            nonce <= unsigned(nonce_register_1(15 downto 0) & nonce_register_0);
            
            data_out_register_0 <= std_logic_vector(data_out(31 downto 0));
            data_out_register_1 <= std_logic_vector(data_out(63 downto 32));
            data_out_register_2 <= std_logic_vector(data_out(95 downto 64));
            data_out_register_3 <= (others => '0');        
        end generate;
        
    BLOCK_SIZE_128: if(BLOCK_SIZE=128) generate
        begin
            data_in <= unsigned(data_in_register_3 & 
                                       data_in_register_2 & 
                                       data_in_register_1 & 
                                       data_in_register_0);
            nonce <= unsigned(nonce_register_1 & nonce_register_0);
            
            data_out_register_0 <= std_logic_vector(data_out(31 downto 0));
            data_out_register_1 <= std_logic_vector(data_out(63 downto 32));
            data_out_register_2 <= std_logic_vector(data_out(95 downto 64));
            data_out_register_3 <= std_logic_vector(data_out(127 downto 96));        
        end generate;
    
        
    KEY_SIZE_64: if(KEY_SIZE=64) generate
        begin
            key <= unsigned(key_register_1 & 
                            key_register_0);
        end generate;
    
    KEY_SIZE_72: if(KEY_SIZE=72) generate
        begin
            key <= unsigned(key_register_2(7 downto 0) & 
                            key_register_1 & 
                            key_register_0);
        end generate;
    
    KEY_SIZE_96: if(KEY_SIZE=96) generate
        begin
            key <= unsigned(key_register_2 & 
                            key_register_1 & 
                            key_register_0);
        end generate;
        
    KEY_SIZE_128: if(KEY_SIZE=128) generate
        begin
            key <= unsigned(key_register_3 & 
                            key_register_2 & 
                            key_register_1 & 
                            key_register_0);
        end generate;
        
    KEY_SIZE_144: if(KEY_SIZE=144) generate
        begin
            key <= unsigned(key_register_4(15 downto 0) & 
                            key_register_3 & 
                            key_register_2 & 
                            key_register_1 & 
                            key_register_0);
        end generate;
        
    KEY_SIZE_192: if(KEY_SIZE=192) generate
        begin
            key <= unsigned(key_register_5 & 
                            key_register_4 & 
                            key_register_3 & 
                            key_register_2 & 
                            key_register_1 & 
                            key_register_0);
        end generate;
        
    KEY_SIZE_256: if(KEY_SIZE=256) generate
        begin
            key <= unsigned(key_register_7 & 
                            key_register_6 & 
                            key_register_5 & 
                            key_register_4 & 
                            key_register_3 & 
                            key_register_2 & 
                            key_register_1 & 
                            key_register_0);
        end generate;
	-- User logic ends

end arch_imp;
