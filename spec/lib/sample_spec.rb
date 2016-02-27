describe GridPoint do

  let(:p4_7) { GridPoint.new(4, 7) }

  describe '.new' do
    it 'newできる' do
      p4_7 = GridPoint.new(4, 7)
    end
  end

  describe '#x' do
    it 'x座標が取得できる' do
      is_asserted_by { p4_7.x == 4 }
    end
  end

  describe '#y' do
    it 'y座標が取得できる' do
      is_asserted_by { p4_7.y == 7 }
    end
  end

  describe '#to_s' do
    it '文字列表記が取得できる' do
      is_asserted_by{p4_7.to_s == "(4,7)"}
    end
  end

  describe '#==' do
    it '(4,7) と (4,7) は同じ座標を持つ' do
      cloned_p4_7 = GridPoint.new(4, 7)
      is_asserted_by{p4_7 == cloned_p4_7}
    end

    it '(4,7) と (3,8) は同じ座標を持たない' do
      new_point = GridPoint.new(4, 7)
      is_asserted_by{p4_7 == new_point}
      new_point.x = 3
      new_point.y = 8
      is_asserted_by{p4_7 != new_point}
    end
  end

  describe '#neighbor_of?' do
    it '(4,7) と (3,7) は隣り合っている' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(3, 7)) }
    end

    it '(4,7) と (3,8) は隣り合っていない' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(3, 8)) == false }
    end

    it '(4,7) と (5,7) は隣り合っている' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(5, 7)) }
    end

    it '(4,7) と (4,8) は隣り合っている' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(4, 8)) }
    end

    it '(4,7) と (4,6) は隣り合っている' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(4, 6)) }
    end

    it '(4,7) と (4,9) は隣り合っていない' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(4, 9)) == false }
    end

    it '(4,7) と (4,7) は隣り合っていない' do
      is_asserted_by { p4_7.neighbor_of?(GridPoint.new(4, 7)) == false }
    end
  end
end

describe GridPoints do
  describe '.new' do
    it '.new できる' do
      GridPoints.new(GridPoint.new(4, 7), GridPoint.new(10, 20))
    end

    context '同じ格子点の場合' do
      it '例外をはく' do
        expect { GridPoints.new(GridPoint.new(4, 7), GridPoint.new(4, 7)) }.to raise_error(GridPoints::SamePointError)
      end
    end
  end

  describe '#contain?' do

    let(:grid_points) { GridPoints.new(GridPoint.new(4, 7), GridPoint.new(10, 20)) }

    context '格子点集合が、指定した格子点を含む場合' do
      it 'true を返す' do
        is_asserted_by { grid_points.contain?(GridPoint.new(4, 7)) }
      end

      it 'true を返す' do
        is_asserted_by { grid_points.contain?(GridPoint.new(10, 20)) }
      end
    end

    context '格子点集合が、指定した格子点を含まない場合' do
      it 'false を返す' do
        is_asserted_by { grid_points.contain?(GridPoint.new(5, 7)) == false }
      end
    end
  end

end
